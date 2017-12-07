unset HISTFILE

# Brew
export PATH="/usr/local/sbin:${PATH}"

# GO
export PATH=${HOME}/go/bin:${PATH}

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Hub
eval "$(hub alias -s)"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
. ~/.bash_aliases
. ~/.docker_aliases

# Bash Prompt
. ~/.bash_prompt

# Vault
. ~/.vault_profile

# SSH Keys
if [[ -z "$(ssh-add -l | grep 4096)" ]]; then ssh-add; fi
