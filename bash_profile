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
[ -z "$(ssh-add -l | grep 4096)" ] && ssh-add

# Bash prompt
[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt
