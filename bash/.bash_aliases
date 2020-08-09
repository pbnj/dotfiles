################################################################################
# Generic
################################################################################

alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"

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

################################################################################
# macOS
################################################################################

## brew
if command -v brew &>/dev/null; then
        alias bubu="brew upgrade && brew cask upgrade && brew cleanup"
fi

################################################################################
# kubernetes
################################################################################

## sh ${DOTFILES}/scripts/tools/kubernetes/kubectl.sh
command -v kubectl &>/dev/null && source <(kubectl completion bash)

## kops
command -v kops &>/dev/null && source <(kops completion bash)

## GO111MODULE="on" go get sigs.k8s.io/kind@v0.7.0
command -v kind &>/dev/null && source <(kind completion bash)

## brew install helm
command -v helm &>/dev/null && source <(helm completion bash)

## activate various k8s environments
alias kcfg='export KUBECONFIG=$(find ${HOME}/.kube/configs -exec realpath {} \; | fzf)'

################################################################################
# 1Password
################################################################################

command -v op &>/dev/null && source <(op completion bash)

################################################################################
# vim
################################################################################

alias vi="vim -u NONE"

## select one or more files from current working directory to edit
vif() {
        FILES=$(fzf --multi --preview="cat {}")
        [[ -n "${FILES}" ]] && vim "${FILES}"
}

## select one or more git files to edit
vig() {
        FILES=$(git ls-files | fzf --multi --preview="cat {}")
        [[ -n "${FILES}" ]] && vim "${FILES}"
}

## select one or more git-modified files to edit
vis() {
        FILES=$(git ls-files --modified | fzf --multi --preview="cat {}")
        [[ -n "${FILES}" ]] && vim "${FILES}"
}

## select one or more TODO files to edit
vit() {
        FILES=$(git grep -l "TODO" | fzf --multi --preview="cat {}")
        [[ -n "${FILES}" ]] && vim "${FILES}"
}

################################################################################
# vault
################################################################################

## brew install vault
command -v vault &>/dev/null && complete -C /usr/local/bin/vault vault

################################################################################
# fzf
################################################################################

alias fzfp="fzf --preview='cat {}'"

################################################################################
# Linux
################################################################################

if command -v apt &>/dev/null; then
        alias auau="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
fi

################################################################################
# gh
################################################################################

command -v gh &>/dev/null && source <(gh completion --shell bash)
