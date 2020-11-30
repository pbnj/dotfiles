##############################################################################
# Generic
################################################################################

alias ..="cd .."

alias ...="cd ../.."
alias grep="grep --color=auto"

alias ll="ls -alFh"

# cargo install exa
if command -v exa &>/dev/null; then
    alias ls="exa"
    alias ll="exa --all --long --git --group-directories-first"
fi

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

################################################################################
# macOS
################################################################################

## brew
command -v brew &>/dev/null && alias bubu="brew upgrade && brew upgrade --cask && brew cleanup"

################################################################################
# git
################################################################################

## brew install glab
command -v glab &>/dev/null && source <(glab completion --shell bash)

## brew install gh
command -v gh &>/dev/null && source <(gh completion --shell bash)

################################################################################
# kubernetes
################################################################################

## sh ${DOTFILES}/scripts/tools/kubernetes/kubectl.sh
command -v kubectl &>/dev/null && source <(kubectl completion bash)

## GO111MODULE="on" go get sigs.k8s.io/kind@v0.7.0
# command -v kind &>/dev/null && source <(kind completion bash)

## brew install helm
# command -v helm &>/dev/null && source <(helm completion bash)

## activate various k8s environments
alias kcfg='export KUBECONFIG=$(find ${HOME}/.kube/configs -exec realpath {} \; | fzf)'
alias k='kubectl'
complete -F __start_kubectl k

################################################################################
# vim
################################################################################

alias vi="vim -u NONE"

## select one or more files from current working directory to edit
vif() {
    FILES=$(fzf --multi --preview="cat {}")
    [ -n "${FILES}" ] && vim "${FILES}"
}

## select one or more git files to edit
vig() {
    FILES=$(git ls-files | fzf --multi --preview="cat {}")
    [ -n "${FILES}" ] && vim "${FILES}"
}

## select one or more git-modified files to edit
vis() {
    FILES=$(git ls-files --modified | fzf --multi --preview="cat {}")
    [ -n "${FILES}" ] && vim "${FILES}"
}

## select one or more TODO files to edit
vit() {
    FILES=$(git grep -l "TODO" | fzf --multi --preview="cat {}")
    [ -n "${FILES}" ] && vim "${FILES}"
}
