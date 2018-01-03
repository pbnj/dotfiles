unset HISTFILE

# Brew
export PATH="/usr/local/sbin:${PATH}"

# GO
export PATH=$PATH:$HOME/go/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Hub
eval "$(hub alias -s)"

# Aliases
[ -f $HOME/.bash_aliases ] && source ~/.bash_aliases

# SSH Keys
SSH_AGENT=$(which ssh-agent)
[ -z "$SSH_AUTH_SOCK" ] && eval $($SSH_AGENT) && ssh-add

# Bash prompt
[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt
