set right_segment_separator \uE0B2
set -g current_right_bg NONE

set -q color_hg_changed_bg; or set color_hg_changed_bg yellow
set -q color_hg_changed_str; or set color_hg_changed_str black
set -q color_hg_bg; or set color_hg_bg green
set -q color_hg_str; or set color_hg_str black
set -q color_git_dirty_bg; or set color_git_dirty_bg yellow
set -q color_git_dirty_str; or set color_git_dirty_str black
set -q color_git_bg; or set color_git_bg green
set -q color_git_str; or set color_git_str black
set -q color_svn_bg; or set color_svn_bg green
set -q color_svn_str; or set color_svn_str black

function prompt_right_segment -d "Function to draw a segment"
  set -l bg
  set -l fg
  if [ -n "$argv[1]" ]
    set bg $argv[1]
  else
    set bg normal
  end
  if [ -n "$argv[2]" ]
    set fg $argv[2]
  else
    set fg normal
  end
  if [ "$current_right_bg" != 'NONE' -a "$argv[1]" != "$current_right_bg" ]
    set_color $bg
    set_color -b $current_right_bg
    echo -n "$right_segment_separator"
    set_color -b $bg
    set_color $fg
  else
    set_color -b $bg
    set_color $fg
  end
  set current_right_bg $argv[1]
  if [ -n "$argv[3]" ]
    echo -n -s " " $argv[3]
  end
end

function prompt_right_start -d "Start segments"
  set current_right_bg $argv[1]
  if [ -n $current_right_bg ]
    set_color normal
    set_color $current_right_bg
    echo -n "$right_segment_separator"
    set_color normal
  end
  set -g current_right_bg NONE
end

function prompt_right_finish -d "Close open segments"
  set_color normal
  set -g current_right_bg NONE
end

function exit_code_or_status
  set ec $argv[1]
  if test $ec -lt 128
    echo "$ec"
  else
    set sig (math $ec - 128)
    echo -n "SIG"(kill --list=$sig)"($sig)"
  end
end


function prompt_status_full
  set ecs $RETVAL
  set ec_text (exit_code_or_status $ecs[1])
  set ec_sum $ecs[1]

  for ec in $ecs[2..-1]
    set ec2 (exit_code_or_status $ec)
    set ec_text "$ec_text|$ec2"
    if string match -qr 'SIG.*' $ec2
      set ec2 1
    end
    set ec_sum (math $ec_sum + $ec2)
  end

  # printf "|$ec_sum ($ecs)|"

  if test $ec_sum -gt 0
    prompt_right_start red
    prompt_right_segment red bryellow "$ec_text ↵  "
  else
    prompt_right_start black
    prompt_right_segment black green "✔ "
  end
end

function prompt_hg -d "Display mercurial state"
  set -l branch
  set -l state
  if command hg id >/dev/null 2>&1
      set branch (command hg id -b)
      # We use `hg bookmarks` as opposed to `hg id -B` because it marks
      # currently active bookmark with an asterisk. We use `sed` to isolate it.
      set bookmark (hg bookmarks | sed -nr 's/^.*\*\ +\b(\w*)\ +.*$/:\1/p')
      set state (hg_get_state)
      set revision (command hg id -n)
      set branch_symbol \uE0A0
      set prompt_text "$branch_symbol $branch$bookmark:$revision"
      if [ "$state" = "0" ]
          prompt_right_segment $color_hg_changed_bg $color_hg_changed_str $prompt_text " ±"
      else
          prompt_right_segment $color_hg_bg $color_hg_str $prompt_text
      end
  end
end

function hg_get_state -d "Get mercurial working directory state"
  if hg status | grep --quiet -e "^[A|M|R|!|?]"
    echo 0
  else
    echo 1
  end
end


function prompt_git -d "Display the current git state"
  set -l ref
  set -l dirty
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set dirty (parse_git_dirty)
    set ref (command git symbolic-ref HEAD 2> /dev/null)
    if [ $status -gt 0 ]
      set -l branch (command git show-ref --head -s --abbrev |head -n1 2> /dev/null)
      set ref "➦ $branch "
    end
    set branch_symbol \uE0A0
    set -l branch (echo $ref | sed  "s-refs/heads/-$branch_symbol -")
    if [ "$dirty" != "" ]
      prompt_right_segment $color_git_dirty_bg $color_git_dirty_str "$branch $dirty "
    else
      prompt_right_segment $color_git_bg $color_git_str "$branch $dirty"
    end
  end
end


function prompt_svn -d "Display the current svn state"
  set -l ref
  if command svn info >/dev/null 2>&1
    set branch (svn_get_branch)
    set branch_symbol \uE0A0
    set revision (svn_get_revision)
    prompt_right_segment $color_svn_bg $color_svn_str "$branch_symbol $branch:$revision"
  end
end

function svn_get_branch -d "get the current branch name"
  svn info 2> /dev/null | awk -F/ \
      '/^URL:/ { \
        for (i=0; i<=NF; i++) { \
          if ($i == "branches" || $i == "tags" ) { \
            print $(i+1); \
            break;\
          }; \
          if ($i == "trunk") { print $i; break; } \
        } \
      }'
end

function svn_get_revision -d "get the current revision number"
  svn info 2> /dev/null | sed -n 's/Revision:\ //p'
end

function prompt_date
  prompt_right_segment white black (date +"%T ")
end

function fish_right_prompt
  set -g RETVAL $pipestatus
  set -q RETVAL; or set -g RETVAL 0

  prompt_status_full
  if [ (cwd_in_scm_blacklist | wc -c) -eq 0 ]
    type -q hg;  and prompt_hg
    type -q git; and prompt_git
    type -q svn; and prompt_svn
  end
  prompt_date
  prompt_right_finish
end
