##########
# ZSH
##########
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/pbnj/.oh-my-zsh"

plugins=(
	git
	ssh-agent
	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

##########
# EXPORTS
##########
# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
[ -d "$HOME/.gimme" ] && source "$HOME/.gimme/envs/latest.env"

# RUST
[ -d "$HOME/.cargo" ] && source "$HOME/.cargo/env"

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

# Shell
if command -v exa &>/dev/null; then
	alias ls="exa"
	alias ll="exa --all --long --git --group-directories-first"
else
	alias ll="ls -alFh --group-directories-first"
fi

# Hub
if command -v hub &>/dev/null; then
	eval "$(hub alias -s)"
fi

##########
# FPATH
##########
fpath=(/usr/local/share/zsh-completions $fpath)

##########
# PROMPT
##########
eval "$(starship init zsh)"

