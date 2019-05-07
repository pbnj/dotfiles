# Generic
alias ..="cd .."
alias ...="cd ../.."

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias grep="grep --color=auto"

if command -v exa &> /dev/null; then
	alias ls="exa"
	alias ll="exa -alFh"
else
	alias ll="ls -alFh --color=auto --group-directories-first"
fi
if command -v bat &> /dev/null; then
	alias cat="bat"
fi
alias vi="vim -u NONE"
