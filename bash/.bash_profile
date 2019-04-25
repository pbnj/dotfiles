## SETTINGS
for file in ~/.{bash_prompt,exports,bash_aliases}; do
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

## GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GO111MODULE=auto
if [ -d "/usr/local/go" ]; then
	export PATH="$PATH:/usr/local/go/bin"
fi

## HUB
command -v hub &> /dev/null && eval "$(hub alias -s)"

## KUBECTL
command -v kubectl &> /dev/null && source <(kubectl completion bash)

## RUST
export PATH="$HOME/.cargo/bin:$PATH"

## BASH COMPLETION
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
