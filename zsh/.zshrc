export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/ubuntu/.oh-my-zsh"

#######################################
# PROMPT
########################################

autoload -U promptinit; promptinit
prompt pure

plugins=(
	aws
	cargo
	docker
	fzf
	git
	git-extras
	git-flow
	git-hubflow
	github
	golang
	helm
	kubectl
	rust
)

source $ZSH/oh-my-zsh.sh

# User configuration

########################################
# EXPORTS
########################################

export EDITOR=vim
export GIT_TERMINAL_PROMPT=1
export HISTCONTROL=ignoredups;
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export MANPAGER="less -X";
export SAVEHIST=1000

########################################
# PLUGINS
########################################

# SSH AGENT
SSH_ENV="$HOME/.ssh/environment"

function start_agent() {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" >/dev/null
	/usr/bin/ssh-add
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" >/dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep "ssh-agent$" >/dev/null || {
		start_agent
	}
else
	start_agent
fi

# K8S
[ -d "$HOME/.krew" ] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

########################################
# ALIASES
########################################

# Generic
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"
alias reload!='exec "$SHELL" -l'

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias kk="kubekit"

# Exa
command -v exa &>/dev/null \
	&& alias ll="exa -alFh --git --group-directories-first" \
	|| alias ll="ls -alFh --color=auto --group-directories-first"

# Hub
alias tdhub="GITHUB_HOST=github.td.teradata.com hub"

