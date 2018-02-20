export EDITOR=nvim

# GO
export GOPATH=$HOME/go
export GOBIN=/usr/local/go/bin
export PATH=$PATH:$GOBIN:$GOPATH/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Load SSH identities
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# Load aliases
[ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases

# Load bash_prompt
[ -f $HOME/.bash_prompt ] && . $HOME/.bash_prompt
