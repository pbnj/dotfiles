export EDITOR=vim

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Load SSH identities
[ -z "$SSH_AUTH_SOCK" ] && eval $(ssh-agent) && ssh-add

# Load aliases
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# Load bash_prompt
[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt

# Load bash-git-prompt
## Add Git Status to bash prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'; }
# export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n$ "
export PS1="\n\u@\h \[\033[32m\]\w\[\033[33m\]\$(__git_ps1)\[\033[00m\]\n$ "
## Change terminal title
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

# Load bash_completion
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

# Load Vault profile
[ -f $HOME/vault/scripts/vault_profile.sh ] && source $HOME/vault/scripts/vault_profile.sh

