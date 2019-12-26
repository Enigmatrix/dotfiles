# Start tmux on startup
if status is-interactive
and not set -q TMUX
  exec tmux
end

# ┌─────────┐
# │ Aliases │
# └─────────┘

alias vim nvim

# ┌───────────┐
# │ Variables │
# └───────────┘

set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
set -x GHIDRA_INSTALL_DIR "/home/enigmatrix/.repos/ghidra_9.1_PUBLIC"

set    shortpaths "/home/enigmatrix"
set -a shortpaths "/media/enigmatrix/Data/Code/vboxshared"
set -a shortpaths "/media/enigmatrix/Windows"
set -a shortpaths "/media/enigmatrix/Data/Code/Personal"
set -a shortpaths "/media/enigmatrix/Data"

set    shortpathicons '\uf015 '
set -a shortpathicons '\uf1e0 '
set -a shortpathicons '\uf17a '
set -a shortpathicons '\uf121 '
set -a shortpathicons '\uf1c0 '
