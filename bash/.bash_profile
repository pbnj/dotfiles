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

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
	source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

## KUBECTL
if command -v kubectl &>/dev/null; then
	source <(kubectl completion bash)
fi

## FZF
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

## BREW
[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
command -v brew &>/dev/null && source "$(brew --prefix)/etc/bash_completion"
