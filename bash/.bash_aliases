# Generic
alias ..="cd .."
alias ...="cd ../.."

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Detect which `ls` flavor is in use
alias sudo='sudo'
alias l="ls --group-directories-first --color=auto -alFh"
alias ls="ls --group-directories-first --color=auto -alFh"
alias grep="grep --color=auto"

# Kubernetes
if command -v kubectl &>/dev/null; then
  alias k="kubectl"
  alias kc="kubectl config"
  alias kd="kubectl describe"
  alias kdd="kubectl describe deploy"
  alias kdp="kubectl describe pod"
  alias kg="kubectl get"
  alias kgd="kubectl get deploy"
  alias kgp="kubectl get pod"
fi

# Docker
if command -v docker &>/dev/null; then
  alias d="docker"
  alias db="docker build"
  alias di="docker images"
  alias dps="docker ps"
  alias dpsa="docker ps -aq"
  alias drm="docker rm"
  alias drmi="docker rmi"
fi
