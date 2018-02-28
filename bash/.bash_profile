# GENERAL
export EDITOR=vim
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"

# GO
export PATH=$PATH:$(go env GOPATH)/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# HUB
[ type hub > /dev/null 2>&1 ] && eval $(hub alias -s) || true

# Load SSH identities
[ -z "$SSH_AUTH_SOCK" ] && eval $(ssh-agent) && ssh-add

# Load aliases
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# Load git-prompt
[ -f $HOME/.git-prompt.sh ] && source $HOME/.git-prompt.sh

# Load bash_prompt
[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt

# Load bash_completion
# [ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

# Load Vault profile
# [ -f $HOME/vault/scripts/vault_profile.sh ] && source $HOME/vault/scripts/vault_profile.sh

