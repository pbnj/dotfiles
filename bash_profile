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
. ~/.bash_aliases

# Bash Prompt
. ~/.bash_prompt

# Vault
# [ -f ~/.vault_profile ] && source ~/.vault_profile


# SSH Keys
# eval $(ssh-agent)
[ -z "$(ssh-add -l | grep 4096)" ] && ssh-add

source ~/.git_prompt
