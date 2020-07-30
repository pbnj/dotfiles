# Generic
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"
alias vi="vim -u NONE"

# cargo install exa
if command -v exa &>/dev/null; then
        alias ls="exa"
        alias ll="exa --all --long --git --group-directories-first"
else
        alias ll="ls -alFh --group-directories-first"
fi

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# macOS
## brew
if command -v brew &>/dev/null; then
        alias bubu="brew upgrade && brew cask upgrade && brew cleanup"
fi

# kube
## sh ${DOTFILES}/scripts/tools/kubernetes/kubectl.sh
command -v kubectl &>/dev/null && source <(kubectl completion bash)

## kops
command -v kops &>/dev/null && source <(kops completion bash)

## GO111MODULE="on" go get sigs.k8s.io/kind@v0.7.0
command -v kind &>/dev/null && source <(kind completion bash)

## brew install kubectl
if command -v kubectl &>/dev/null; then
        alias k="kubectl"
        alias ksys="kubectl -n kube-system"
        complete -F __start_kubectl k
        complete -F __start_kubectl ksys
fi

## brew install helm
if command -v helm &>/dev/null; then
        source <(helm completion bash)
fi

## aliases to activate various k8s environments
alias kcfg='export KUBECONFIG=$(find ${HOME}/.kube/configs -exec realpath {} \; | fzf)'
if [[ -d "$HOME/.kube/configs" ]]; then
        for config in $(ls "${HOME}/.kube/configs"); do
                alias kcfg-${config}="export KUBECONFIG=${HOME}/.kube/configs/${config}"
        done
fi

# git
## status
alias gst="git status --short"
alias gd="git diff"

## gh
command -v gh &>/dev/null && source <(gh completion --shell bash)

# op
command -v op &>/dev/null && source <(op completion bash)

# vim
alias vi=vim
## select one or more files from current working directory to edit
alias vif='vim $(fzf --multi --preview="cat {}")'
## select one or more git files to edit
alias vig='vim $(git ls-files | fzf --multi --preview="cat {}")'
## select one or more git-modified files to edit
alias vis='vim $(git ls-files --modified | fzf --multi --preview="cat {}")'
## select one or more TODO files to edit
alias vit='vim $(git grep -l "TODO" | fzf --multi --preview="cat {}")'

# vault
## brew install vault
if command -v vault &>/dev/null; then
        alias v="vault"
        complete -C /usr/local/bin/vault vault
        complete -C /usr/local/bin/vault v
fi

# FZF
alias fzfp="fzf --preview='cat {}'"

# Linux
if command -v apt &>/dev/null; then
        alias auau="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
fi
