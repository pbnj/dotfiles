##########
# ZSH
##########
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
	rustup # mkdir ~/.oh-my-zsh/custom/plugins/rustup && rustup completions zsh > !$ && rm ~/.zcompdump*
	cargo # mkdir ~/.oh-my-zsh/custom/plugins/cargo && rustup completions zsh > !$ && rm ~/.zcompdump*
	ssh-agent
	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

##########
# LANGUAGES
##########
# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
[[ -d "$HOME/.gimme" ]] && source "$HOME/.gimme/envs/latest.env"

# RUST
[[ -d "$HOME/.cargo" ]] && source "$HOME/.cargo/env"

# NVM
[[ -d "$HOME/.nvm" ]] && source "$HOME/.nvm/nvm.sh"

# FZF
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

##########
# ALIASES
##########
# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# K8s
if command -v kubectl &>/dev/null; then
	alias k="kubectl"
fi
if command -v kubectx &>/dev/null; then
	alias kctx="kubectx"
fi
if command -v kubens &>/dev/null; then
	alias kns="kubens"
fi

# Misc
if command -v exa &>/dev/null; then
	alias ls="exa"
	alias ll="exa --all --long --git --group-directories-first"
fi

# Hub
if command -v hub &>/dev/null; then
	eval "$(hub alias -s)"
fi

##########
# PROMPT
##########
eval "$(starship init zsh)"
