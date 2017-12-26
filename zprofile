# GO
export PATH=$PATH:$HOME/go/bin

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

# Hub
eval "$(hub alias -s)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# SSH Keys
[ -z "$SSH_AUTH_SOCK" ] && eval $(ssh-agent) && ssh-add

