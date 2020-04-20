# Generic
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"
# alias vim="vim -u NONE"

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

## K8S
# sh ${DOTFILES}/scripts/tools/kubernetes/kubectl.sh
command -v kubectl &>/dev/null && source <(kubectl completion bash)
# GO111MODULE="on" go get sigs.k8s.io/kind@v0.7.0
command -v kind &>/dev/null && source <(kind completion bash)
# sh ${DOTFILES}/scripts/tools/kubernetes/krew.sh
[[ -d "$HOME/.krew" ]] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# sh ${DOTFILES}/scripts/tools/kubernetes/kubectx.sh
[[ -d "$HOME/.kubectx" ]] && export PATH="$HOME/.kubectx:$PATH"

# brew install kubectl
if command -v kubectl &>/dev/null; then
	alias k="kubectl"
	complete -F __start_kubectl k
fi
# brew install kubectx
if command -v kubectx &>/dev/null; then
	alias kctx="kubectx"
fi
if command -v kubens &>/dev/null; then
	alias kns="kubens"
fi
# brew install helm
if command -v helm &>/dev/null; then
	source <(helm completion bash)
fi

# cargo install exa
if command -v exa &>/dev/null; then
	alias ls="exa"
	alias ll="exa --all --long --git --group-directories-first"
else
	alias ll="ls -alFh --group-directories-first"
fi

## Vault
# brew install vault
if command -v vault &>/dev/null; then
	alias v="vault"
	complete -C /usr/local/bin/vault vault
	complete -C /usr/local/bin/vault v
fi
