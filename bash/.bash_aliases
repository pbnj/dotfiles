# Generic
alias ..="cd .."
alias ...="cd ../.."

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias grep="grep --color=auto"

alias ll="ls -alFh --color=auto --group-directories-first"
alias vi="vim -u NONE"

## HUB
command -v hub &>/dev/null && eval "$(hub alias -s)"
