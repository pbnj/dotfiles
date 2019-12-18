########################################
# SHELL OPTIONS
########################################

shopt -s direxpand
shopt -s nocaseglob
shopt -s histappend
shopt -s dirspell
shopt -s cdspell
shopt -s autocd
shopt -s globstar

########################################
# EXPORTS
########################################

export EDITOR=vim
export GIT_TERMINAL_PROMPT=1
export HISTCONTROL=ignoredups;
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export MANPAGER="less -X";

########################################
# PLUGINS
########################################

# GNU UTILS
[ -d "/usr/local/opt/coreutils/libexec/gnubin" ] \
	&& export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

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

# BASH COMPLETION
if [ -f /usr/local/etc/bash_completion ]; then
	source /usr/local/etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
	source /usr/share/bash-completion/bash_completion
elif [ -r "/usr/local/etc/profile.d/bash_completion.sh" ]; then
	source "/usr/local/etc/profile.d/bash_completion.sh"
elif command -v brew &>/dev/null; then
	[ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
		source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
else
	echo "No bash completion found"
fi

# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
[ -d "/usr/local/go" ] && export PATH="/usr/local/go/bin:$PATH"
[ -d "$HOME/.gimme" ] && source "$HOME/.gimme/envs/latest.env"

# CARGO
if [ -d "$HOME/.cargo" ]; then
	source $HOME/.cargo/env
	source <(rustup completions bash)
	source <(rustup completions bash cargo)
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] \
	&& source "$NVM_DIR/nvm.sh"          # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] \
	&& source "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# K8S
[ -d "$HOME/.krew" ] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
command -v kubectl &>/dev/null && source <(kubectl completion bash)
command -v kind &>/dev/null && source <(kind completion bash)

########################################
# ALIASES
########################################

# Generic
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"

# For safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# K8s
command -v kubectl &>/dev/null && alias k="kubectl" && complete -F __start_kubectl k
command -v kubectx &>/dev/null && alias kctx="kubectx"
command -v kubens &>/dev/null && alias kns="kubens"

alias ll="ls -alFh --group-directories-first"

# Hub
if command -v hub &>/dev/null; then
	eval "$(hub alias -s)"
	alias tdhub="GITHUB_HOST=github.td.teradata.com hub"
fi

########################################
# PROMPT
########################################
[ -f "$HOME/.bash_prompt" ] && source "$HOME/.bash_prompt"
