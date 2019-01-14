## SETTINGS
for file in ~/.{path,bash_prompt,exports,bash_aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

for opt in direxpand nocaseglob histappend dirspell cdspell autocd globstar; do
  shopt -s $opt &>/dev/null
done
unset opt

## GNU UTILS
if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

## PYTHON
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi
if [ -d "$HOME/Library/Python/3.7/bin" ]; then
  export PATH="$PATH:$HOME/Library/Python/3.7/bin"
fi
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
  export PATH="$PATH:$HOME/Library/Python/2.7/bin"
fi

## RUST
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

## GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
if [ -d "/usr/local/go" ]; then
	export PATH="/usr/local/go/bin:$PATH"
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
if [ -f "/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR="/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share"
	source "/home/linuxbrew/.linuxbrew/opt/bash-git-prompt/share/gitprompt.sh"
fi

# ## SSH
# SSH_ENV="$HOME/.ssh/environment"
#
# function start_agent() {
#   echo "Initialising new SSH agent..."
#   /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
#   echo succeeded
#   chmod 600 "${SSH_ENV}"
#   . "${SSH_ENV}" >/dev/null
#   /usr/bin/ssh-add
# }
# 
# ## Source SSH settings, if applicable
# if [ -f "${SSH_ENV}" ]; then
#   . "${SSH_ENV}" >/dev/null
#   #ps ${SSH_AGENT_PID} doesn't work under cywgin
#   ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ >/dev/null || {
#     start_agent
#   }
# else
#   start_agent
# fi
#
# ## SSH AUTO-COMPLETION
# sh() {
#   local cur prev opts
#   COMPREPLY=()
#   cur="${COMP_WORDS[COMP_CWORD]}"
#   prev="${COMP_WORDS[COMP_CWORD - 1]}"
#   opts=$(grep '^Host' ~/.ssh/config ~/.ssh/config.d/* 2>/dev/null | grep -v '[?*]' | cut -d ' ' -f 2-)
# 
#   COMPREPLY=($(compgen -W "$opts" -- ${cur}))
#   return 0
# }
# complete -F _ssh ssh

## KUBECTL
if command -v kubectl &>/dev/null; then
  source <(kubectl completion bash)
fi

## FZF
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

## ALIAS COMPLETION
# [ -f /etc/profile.d/bash_completion.sh ] && source /etc/profile.d/bash_completion.sh
# [ -f /etc/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
# [ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

## BREW
[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
command -v brew &>/dev/null && source "$(brew --prefix)/etc/bash_completion"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
