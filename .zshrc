export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

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

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

autoload -U compinit && compinit
