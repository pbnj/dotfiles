# Generic
alias ..="cd .."
alias ...="cd ../.."

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Detect which `ls` flavor is in use
alias sudo='sudo '
alias l="ls -alFh --color --group-directories-first"
alias grep="grep --color=auto"
alias nv="nvim"
alias vi="vim"
alias cls="printf \"\033c\""

# Git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gcam="git commit -am"
alias gcb="git checkout -b"
alias gcl="git clone"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gl="git pull"
alias glg="git log"
alias gp="git push"
alias gpull="git pull"
alias gpush="git push"
alias grv="git remote -v"
alias gs="git status"

## HUB
command -v hub &>/dev/null && eval "$(hub alias -s)"

# Kubernetes
alias k="kubectl"
alias kc="kubectl config"
alias kd="kubectl delete"
alias kdd="kubectl delete deploy"
alias kdp="kubectl delete po"
alias kg="kubectl get"
alias kgd="kubectl get deploy"
alias kgp="kubectl get po"

# Docker
alias d="docker"
alias db="docker build"
alias di="docker images"
alias dps="docker ps"
alias dpsa="docker ps -aq"
alias drm="docker rm"
alias drmi="docker rmi"

# macOS
command -v brew &>/dev/null && alias bubu="brew outdated && brew update && brew upgrade && brew cleanup"
## macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum &>/dev/null || alias md5sum="md5"
## macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum &>/dev/null || alias sha1sum="shasum"
