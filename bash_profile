unset HISTFILE

# Brew
export PATH="/usr/local/sbin:${PATH}"

# GO
export PATH=$PATH:$HOME/go/bin

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

# Hub
eval "$(hub alias -s)"

# Aliases
[ -f $HOME/.bash_aliases ] && source ~/.bash_aliases

# Bash completions
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

# SSH Keys
# eval $(ssh-agent)
[ -z "$SSH_AUTH_SOCK" ] && eval $(ssh-agent) && ssh-add

# Bash prompt
[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt
