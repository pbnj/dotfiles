# Brew
export PATH="/usr/local/sbin:${PATH}"

# GO
export PATH=$PATH:$HOME/go/bin

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

# Hub
eval "$(hub alias -s)"

# Aliases
source ~/.aliases

# Vault
# [ -f ~/.vault_profile ] && source ~/.vault_profile

# SSH Keys
# eval $(ssh-agent)
[ -z "$(ssh-add -l | grep 4096)" ] && ssh-add

