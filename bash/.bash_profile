export EDITOR=nvim

# GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# ALIASES
alias nv="nvim"
alias v="nvim"
alias l="gls -alFh --color=auto"
alias bubu="brew update && brew upgrade && brew cleanup"

# BASH COMPLETION
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# SSH AGENT
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# BASH PROMPT
[ -f $HOME/.bash_prompt ] && . $HOME/.bash_prompt
