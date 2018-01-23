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

autoload -U compinit && compinit
