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
# $ brew install git
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
# ddgr
# $ brew install ddgr
################################################################################

ddg() {
    # check if ddgr cli is installed
    if ! command -v ddgr &>/dev/null; then
        echo "Error: could not find 'ddgr' cli in your path."
        echo "For installation instructions, see https://github.com/jarun/ddgr"
        echo "Or, if it is installed, make sure it is in your \${PATH} and try again."
        return 1
    fi

    # check args
    if [ -z "${1}" ] ; then
        echo "Missing: bang"
        echo "Usage: ddg <bang> <search-term>"
        echo ""
        echo "Examples:"
        echo "  $ ddg g \"how to ...\""
        echo "  $ ddg dh ubuntu"
        echo "  $ ddg gh kubernetes/kubernetes"
        echo ""
        echo "For a full list of bangs, see https://duckduckgo.com/bang"
        return 1
    fi

    if [ -z "${2}" ] ; then
        echo "Missing: search-term"
        echo "Usage: ddg <bang> <search-term>"
        echo ""
        echo "Examples:"
        echo "  $ ddg g \"how to ...\""
        echo "  $ ddg dh ubuntu"
        echo "  $ ddg gh kubernetes/kubernetes"
        echo ""
        echo "For a full list of bangs, see https://duckduckgo.com/bang"
        return 1
    fi

    ddgr --np "!${1} ${2}"
}

ddg-google() {
    ddg g "${1}"
}

ddg-gopkg() {
    ddg gopkg "${1}"
}

ddg-gh() {
    ddg gh "${1}"
}

ddg-dh() {
    ddg dh "${1}"
}

ddg-man() {
    ddg man "${1}"
}

ddg-aws() {
    ddg aws "${1}"
}

ddg-gif() {
    ddg gif "${1}"
}

################################################################################
# vim
################################################################################

alias vi="vim -u NONE"

## select one or more files from current working directory to edit
vif() {
    FILES=$(fzf --multi --preview="bat {}")
    [ -n "${FILES}" ] && vim "${FILES}"
}

## select one or more git files to edit
vig() {
    FILES=$(git ls-files | fzf --multi --preview="bat {}")
    [ -n "${FILES}" ] && vim "${FILES}"
}

## select one or more git-modified files to edit
vis() {
    FILES=$(git ls-files --modified | fzf --multi --preview="bat {}")
    [ -n "${FILES}" ] && vim "${FILES}"
}

## select one or more TODO files to edit
vit() {
    FILES=$(git grep -l "TODO" | fzf --multi --preview="bat {}")
    [ -n "${FILES}" ] && vim "${FILES}"
}

# vim: ft=sh
