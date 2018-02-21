# General
export EDITOR=nvim
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Load SSH identities
[ -z "$SSH_AUTH_SOCK" ] && eval $(ssh-agent -s) && ssh-add

# Load aliases
[ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases

# Load bash_prompt
[ -f $HOME/.bash_prompt ] && . $HOME/.bash_prompt
