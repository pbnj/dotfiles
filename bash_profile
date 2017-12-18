unset HISTFILE

# Brew
export PATH="/usr/local/sbin:${PATH}"

# GO
export PATH=${HOME}/go/bin:${PATH}

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Hub
eval "$(hub alias -s)"

# Aliases
source ~/.bash_aliases

# Bash completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# SSH Keys
[ -z "$(ssh-add -l | grep 4096)" ] && ssh-add

# Git prompt
source ~/.git_prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

# Bash prompt
export PS1='
\W$(__git_ps1 " (%s)")
$ '
