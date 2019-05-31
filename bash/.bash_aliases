# Generic
alias ..="cd .."
alias ...="cd ../.."

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias grep="grep --color=auto"

if command -v exa &>/dev/null; then
	alias ll="exa -alFh --git --group-directories-first"
else
	alias ll="ls -alFh --color=auto --group-directories-first"
fi

# Hub
alias tdhub="GITHUB_HOST=github.td.teradata.com hub"

