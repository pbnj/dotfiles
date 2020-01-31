# Generic
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# K8s
# brew install kubectl
if command -v kubectl &>/dev/null; then
	alias k="kubectl"
	complete -F __start_kubectl k
fi
# brew install kubectx
if command -v kubectx &>/dev/null; then
	alias kctx="kubectx"
fi
if command -v kubens &>/dev/null; then
	alias kns="kubens"
fi

# cargo install exa
if command -v exa &>/dev/null; then
	alias ls="exa"
	alias ll="exa --all --long --git --group-directories-first"
else
	alias ll="ls -alFh --group-directories-first"
fi

# Hub
# brew install hub
if command -v hub &>/dev/null; then
	eval "$(hub alias -s)"
fi
