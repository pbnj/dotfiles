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

export DOTFILES="$HOME/.dotfiles"
export BAT_THEME="GitHub"
export BAT_PAGER=""

########################################
## SETTINGS
########################################

## PATH
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "/usr/local/sbin" ]] && export PATH="/usr/local/sbin:$PATH"

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

## FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
[[ -f "$HOME/.fzf.bash" ]] && source "$HOME/.fzf.bash"

########################################
## ALIASES
########################################

[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

########################################
## PROMPT
########################################

## plain bash_prompt
# [ -f "$HOME/.bash_prompt" ] && source "${HOME}/.bash_prompt"

## starship
# cargo install starship
if command -v starship &>/dev/null; then
	eval "$(starship init bash)"
fi
