# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/enigmatrix/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# set list of themes to load
# setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias conf-zsh="vim ~/.zshrc"
alias conf-svim="vim ~/.SpaceVim.d/init.toml"
alias conf-vim="vim ~/.SpaceVim/vimrc"
alias clear="reset"
alias xopen="xdg-open"
alias ida="WINEPREFIX=~/.wine64 wine ~c/Program\ Files/IDA\ 7.0/ida.exe"
alias ida64="WINEPREFIX=~/.wine64 wine ~c/Program\ Files/IDA\ 7.0/ida64.exe"
alias win32="wine"
alias win64="WINEPREFIX=~/.wine64 wine"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

setopt AUTO_CD

typeset -A icon
icon=(
  /home/enigmatrix '\\uf015 '
  /media/sf_vboxshared '\\uf1e0 '
)
typeset -A paths
paths=(
  /media/sf_vboxshared shrd
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

export PATH=$PATH:/home/enigmatrix/.local/bin
