export ZSH="${HOME}/.oh-my-zsh"
export EDITOR="vim"

ZSH_THEME="agnoster"
DEFAULT_USER="$(whoami)"

plugins=(git github zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"
alias vimconfig="${EDITOR} ~/.vimrc"
alias reload="source ~/.zshrc"

# NVM
export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh" # This loads nvm

# GO
export GOPATH=${HOME}/go
# export PATH=${PATH}:/usr/local/go/bin # for linux
export PATH=${GOPATH}/bin:${PATH}

# ZSH SYNTAX HIGHLIGHTING
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# AWS
# source /usr/local/share/zsh/site-functions/_aws

# Add SSH keys
if [[ -z "$(ssh-add -l)" ]]; then ssh-add; fi
