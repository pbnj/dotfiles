# Brew (macOS)
# export PATH="/usr/local/sbin:${PATH}"

# GO
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Hub
eval "$(hub alias -s)"

# SSH Keys
# SSH_AGENT=$(which ssh-agent)
# SSH_ADD=$(which ssh-add)
# [ -z "$SSH_AUTH_SOCK" ] && eval $($SSH_AGENT) && $SSH_ADD

# Aliases (bash)
# [ -f $HOME/.bash_aliases ] && source ~/.bash_aliases

# Bash prompt (bash)
# [ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt
