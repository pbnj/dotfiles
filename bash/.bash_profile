# SHELL OPTIONS

shopt -s nocaseglob
shopt -s histappend
shopt -s dirspell
shopt -s cdspell
shopt -s autocd
shopt -s globstar

# EXPORTS

[ -f "${HOME}/.exports" ] && source "${HOME}/.exports"

# SETTINGS

## BREW
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

## PATH
[ -d "${HOME}/bin" ] && export PATH="${HOME}/bin:$PATH"
[ -d "/usr/local/sbin" ] && export PATH="/usr/local/sbin:$PATH"

## SSH
SSH_ENV="${HOME}/.ssh/environment"
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
        ps -ef | grep "${SSH_AGENT_PID}" | grep -E "ssh-agent$" >/dev/null || {
                start_agent
        }
else
        start_agent
fi

## BASH COMPLETION
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -r /usr/local/etc/profile.d/bash_completion.sh ] && source /usr/local/etc/profile.d/bash_completion.sh

## PYTHON
# Linux
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# Mac
if [ -d "$HOME/Library/Python/3.9/bin/" ] ; then
    export PATH="${HOME}/Library/Python/3.9/bin/:${PATH}"
fi

## GO
# curl -sL -o /usr/local/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme && chmod +x /usr/local/bin/gimme
if command -v go &>/dev/null; then
        [ -f "${HOME}/.gimme/envs/latest.env" ] && source "${HOME}/.gimme/envs/latest.env"
        export GODEBUG=x509ignoreCN=0
        export GOPATH="${HOME}/go"
        export PATH="${PATH}:${GOPATH}/bin"
fi

## CARGO
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
if [ -d "${HOME}/.cargo" ]; then
        source "${HOME}/.cargo/env"
        source <(rustup completions bash)
        source <(rustup completions bash cargo)
fi

## NODE
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
if [ -d "${HOME}/.nvm" ]; then
        export NVM_DIR="${HOME}/.nvm"
        [ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"
fi

## RUBY
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d "${HOME}/.rvm" ]; then
        export PATH="${HOME}/.rvm/bin:${PATH}"
        [[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

## FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
[ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash"

## DIRENV
# brew install direnv
command -v direnv &>/dev/null && eval "$(direnv hook bash)"

## GIPHY CLI
# https://github.com/pbnj/giphy-cli
[ -f "${HOME}/Projects/giphy-cli/giphy.sh" ] && source "${HOME}/Projects/giphy-cli/giphy.sh"

# PROFILES & ALIASES

[ -f "${HOME}/.bash_aliases" ] && source "${HOME}/.bash_aliases"
[ -f "${HOME}/.work_profile" ] && source "${HOME}/.work_profile"

# PROMPT

[ -f "${HOME}/.bash_prompt" ] && source "${HOME}/.bash_prompt"
