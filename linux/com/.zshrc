source  ~/.zsh/powerlevel9k/powerlevel9k.zsh-theme
source  ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(~/.zsh/zsh-completions/src $fpath)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# aliases

alias vim="nvim"
alias zsh-conf="vim ~/.zshrc"
alias vim-conf="vim ~/.config/nvim/init.vim"

alias clear="reset"
alias xopen="xdg-open"

alias ida="WINEPREFIX=~/.wine64 wine ~c/Program\ Files/IDA\ 7.0/ida.exe"
alias ida64="WINEPREFIX=~/.wine64 wine ~c/Program\ Files/IDA\ 7.0/ida64.exe"
alias win32="wine"
alias win64="WINEPREFIX=~/.wine64 wine"

alias l="ls -lah"
alias ls='ls --color=auto'

alias g="git"
alias ga="git add ."
alias gc="git commit -m "
alias gp="git push"
alias gs="git status"


# continuiing on...

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

setopt AUTO_CD

typeset -A icon
icon=(
  /home/enigmatrix '\\uf015 '
  /media/enigmatrix/Data/Code/vboxshared '\\uf1e0 '
  /media/enigmatrix/Windows '\\uf17a '
  /media/enigmatrix/Data '\\uf1c0 '
  /media/enigmatrix/Data/Code/Personal '%B\\uf121%b '
)
typeset -A paths
paths=(
  /media/enigmatrix/Data/Code/vboxshared shared
  /media/enigmatrix/Windows c
  /media/enigmatrix/Data f
  /media/enigmatrix/Data/Code/Personal proj
)

# configure aliases
for key val in ${(kv)paths}; do
  alias -g "~$val"="$key"
  hash -d $val=$key
done

dir2(){
  local color='%F{blue}'
  local fullpath=$(realpath "`pwd`")
  local path="$fullpath"

  for key val in ${(kv)icon}; do
    if [[ $fullpath = *"$key"* ]]; then
      path="${fullpath/$key/$val}"
      break
    fi
  done

  echo -n "$path"
}

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_to_unique'
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_HOST_ICON="\uF109 "
POWERLEVEL9K_SSH_ICON="\uF489 "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_dir2 dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs time)
POWERLEVEL9K_CUSTOM_DIR2="dir2"
POWERLEVEL9K_CUSTOM_DIR2_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_DIR2_FOREGROUND="white"

export PATH=$PATH:/home/enigmatrix/.local/bin:$HOME/.cargo/bin
export EDITOR=vim
export VISUAL=vim
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=37;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
