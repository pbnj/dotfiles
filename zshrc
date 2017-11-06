export ZSH="/Users/$(whoami)/.oh-my-zsh"
export EDITOR=vim

ZSH_THEME="robbyrussell"
DEFAULT_USER="$(whoami)"

plugins=(git github shrink-path zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Brew
export PATH="/usr/local/sbin:${PATH}"

# NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# GO
export GOPATH=${HOME}/go
export PATH=${PATH}:${GOPATH}/bin

# ZSH SYNTAX HIGHLIGHTING
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# HUB
eval "$(hub alias -s)"

# AWS
source /usr/local/share/zsh/site-functions/_aws

# Add SSH keys
if [[ -z "$(ssh-add -l | grep 4096)" ]]; then ssh-add; fi

# Source aliases
source ~/.bash_aliases
source ~/.docker_aliases
