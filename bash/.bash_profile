export EDITOR=nvim

# GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

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
