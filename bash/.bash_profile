# SETTINGS

source "$HOME/.bash_prompt"
source "$HOME/.exports"
source "$HOME/.bash_aliases"

# SHELL OPTIONS
shopt -s direxpand
shopt -s nocaseglob
shopt -s histappend
shopt -s dirspell
shopt -s cdspell
shopt -s autocd
shopt -s globstar

## GNU UTILS
if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

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

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" >/dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ >/dev/null || {
		start_agent
	}
else
	start_agent
fi

## BASH COMPLETION
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
