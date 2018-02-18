export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"

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
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# HUB
eval $(hub alias -s zsh)

# ENV VARS
# export LANG="en_US.UTF-8"
# export LC_COLLATE="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
# export LC_MESSAGES="en_US.UTF-8"
# export LC_MONETARY="en_US.UTF-8"
# export LC_NUMERIC="en_US.UTF-8"
# export LC_TIME="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"

# Aliases
alias c="clear"
alias d="docker"
alias k="kubectl"
alias l="ls -alFh --group-directories-first"
alias nv="nvim"
alias reload="source ~/.zshrc"

autoload -U compinit && compinit
