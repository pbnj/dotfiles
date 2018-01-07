export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  aws
  # brew # macOS
  docker
  docker-compose
  git
  kubectl
  vault
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

