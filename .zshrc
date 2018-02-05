export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pbnj"

plugins=(
  docker
  docker-compose
  git
  heroku
  kubectl
  shrink-path
  ssh-agent
  vault
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# GO
export GOPATH=$HOME
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# HUB
eval $(hub alias -s)

# ENV VARS
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Aliases
alias c="clear"
alias d="docker"
alias k="kubectl"
alias l="ls -alFh --group-directories-first"
alias v="nvim"
alias reload="source ~/.zshrc"

autoload -U compinit && compinit
