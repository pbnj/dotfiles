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
## For macOS
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

[ -r "/usr/local/etc/profile.d/bash_completion.sh" ] \
	&& . "/usr/local/etc/profile.d/bash_completion.sh"

# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
[ -d "/usr/local/go" ] && export PATH="/usr/local/go/bin:$PATH"
[ -d "$HOME/.gimme" ] && source "$HOME/.gimme/envs/latest.env"

# CARGO
export PATH="$HOME/.cargo/bin:$PATH"
if command -v rustup &>/dev/null; then
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

# k8s
command -v kubectl &>/dev/null && alias k="kubectl"
command -v kubekit &>/dev/null && alias kk="kubekit"

# Exa
command -v exa &>/dev/null \
	&& alias ll="exa -alFh --git --group-directories-first" \
	|| alias ll="ls -alFh --color=auto --group-directories-first"

# Hub
eval "$(hub alias -s)"

########################################
# PROMPT
########################################

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_THEME="Minimal"
    GIT_PROMPT_START="\n"
    GIT_PROMPT_END="\n$ "
    source $HOME/.bash-git-prompt/gitprompt.sh
fi
