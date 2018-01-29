export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  brew
  aws
  docker
  docker-compose
  git
  heroku
  kubectl
  ssh-agent
  vault
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# HUB
eval $(hub alias -s)

# GO
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# ENV VARS
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Aliases
alias c="clear"
alias d="docker"
alias k="kubectl"
alias nv="nvim"
alias v="vim"

autoload -U compinit && compinit
