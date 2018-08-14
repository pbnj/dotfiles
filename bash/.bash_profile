## SETTINGS
for file in ~/.{path,bash_prompt,exports,bash_aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Prevent bash from escaping '$' when bash-completion is installed and <TAB> is pressed
# shopt -s direxpand

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2>/dev/null
done

## COMPLETION
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

## RUST
if [ -d "$HOME/.cargo" ]; then
	export PATH="$HOME/.cargo/bin:$PATH"
fi

## GO
if [ -d "/usr/local/go" ]; then
	export PATH="/usr/local/go/bin:$HOME/go/bin:$PATH"
fi
if [ -d "$HOME/.gimme/envs" ]; then
	source "$HOME/.gimme/envs/latest.env"
	export PATH="$HOME/go/bin:$PATH"
fi

## NVM
if [ -d "$HOME/.nvm" ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                   # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

## HUB
if command -v hub &>/dev/null; then
	eval "$(hub alias -s)"
fi

## GIT
if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
	source "/usr/local/etc/bash_completion.d/git-completion.bash"
fi
## Enable tab completion for `g` by marking it as an alias for `git`
if type _git &>/dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g
fi

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

## KUBECTL ##
if command -v kubectl &>/dev/null; then
	source <(kubectl completion bash)
fi

## MINIKUBE ##
if command -v minikube &>/dev/null; then
	source <(minikube completion bash)
fi

## FZF ##
if [ -f ~/.fzf.bash ]; then
	source ~/.fzf.bash
fi
