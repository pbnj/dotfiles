# Generic
alias ..="cd .."
alias ...="cd ../.."
alias nv="nvim"
alias l="ls -alFh --color=auto --group-directories-first"
alias grep="grep --color=auto"

# Git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gcam="git commit -am"
alias gcb="git checkout -b"
alias gcl="git clone"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gl="git pull"
alias glg="git log"
alias gp="git push"
alias grv="git remote -v"
alias gs="git status"

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

# Vault
alias v="vault"
alias vl="vault login -method=ldap username=$(whoami)"
alias vsl="vault secrets list"
vssh() {
    if [ -n $@ ]; then echo "Please, provide remote host name or IP as arguments. Example: $0 10.1.2.3"; return 1; fi
    vault write -field=signed_key ssh-client-signer/sign/$USER public_key=@$HOME/.ssh/id_rsa.pub > $HOME/.ssh/id_rsa-cert.pub && ssh $@
}

# macOS
if [ $(uname) = "Darwin" ]; then
    alias bubu="brew update && brew upgrade && brew cleanup"
    alias l="gls -alFh --color=auto --group-directories-first"
    alias md5sum="md5"
    alias shasum="sha1sum"
fi
