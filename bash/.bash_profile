########################################
## SHELL OPTIONS
########################################

shopt -s direxpand
shopt -s nocaseglob
shopt -s histappend
shopt -s dirspell
shopt -s cdspell
shopt -s autocd
shopt -s globstar

########################################
## EXPORTS
########################################

export EDITOR=vim
export GIT_TERMINAL_PROMPT=1
export HISTCONTROL=ignoredups
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export MANPAGER="less -X"
export TERM="xterm-256color"

export BAT_THEME="GitHub"
export BAT_PAGER=""

########################################
## SETTINGS
########################################

## PATH
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

## SSH AGENT
SSH_ENV="$HOME/.ssh/environment"

function start_agent() {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" >/dev/null
	/usr/bin/ssh-add
}

## Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" >/dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep "ssh-agent$" >/dev/null || {
		start_agent
	}
else
	start_agent
fi

## BASH COMPLETION
[[ -f /usr/local/etc/bash_completion ]] && source "/usr/local/etc/bash_completion"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh"

## GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
# curl -sL -o /usr/local/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme && chmod +x /usr/local/bin/gimme
[[ -d "$HOME/.gimme" ]] && source "$HOME/.gimme/envs/latest.env"
[[ -d "/usr/local/go" ]] && export PATH="/usr/local/go/bin:$PATH"

## CARGO
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
if [ -d "$HOME/.cargo" ]; then
	source "$HOME/.cargo/env"
	source <(rustup completions bash)
	source <(rustup completions bash cargo)
fi

## NVM
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

## K8S
# ./scripts/tools/kubernetes/kubectl.sh
command -v kubectl &>/dev/null && source <(kubectl completion bash)
# GO111MODULE="on" go get sigs.k8s.io/kind@v0.6.1
command -v kind &>/dev/null && source <(kind completion bash)
# ./scripts/tools/kubernetes/krew.sh
[[ -d "$HOME/.krew" ]] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# ./scripts/tools/kubernetes/kubectx.sh
[[ -d "$HOME/.kubectx" ]] && export PATH="$HOME/.kubectx:$PATH"

## FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
[[ -f "$HOME/.fzf.bash" ]] && source "$HOME/.fzf.bash"

## THEME
if [ "$(uname)" == "Darwin" ]; then
	if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
		sed -i.bak 's/colors: \*xcode_light/colors: \*xcode_dark/' $HOME/.config/alacritty/alacritty.yml
		sed -i.bak 's/background=light/background=dark/' $HOME/.config/nvim/init.vim

	else
		sed -i.bak 's/colors: \*xcode_dark/colors: \*xcode_light/' $HOME/.config/alacritty/alacritty.yml
		sed -i.bak 's/background=dark/background=light/' $HOME/.config/nvim/init.vim
	fi
fi

########################################
## ALIASES
########################################

[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

########################################
## PROMPT
########################################

## bash-git-prompt
# git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
	# GIT_PROMPT_ONLY_IN_REPO=1
	GIT_PROMPT_START="\n\u@\h:\W"
	GIT_PROMPT_END="\n$ "
	source $HOME/.bash-git-prompt/gitprompt.sh
fi

## starship
# cargo install starship
if command -v starship &>/dev/null; then
	eval "$(starship init bash)"
fi
