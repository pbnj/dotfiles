# SHELL OPTIONS

shopt -s nocaseglob
shopt -s histappend
shopt -s direxpand
shopt -s dirspell
shopt -s cdspell
shopt -s autocd
shopt -s globstar

# EXPORTS
[ -f "${HOME}"/.exports ] && source "${HOME}"/.exports

# SETTINGS

## BREW
[ -d "${HOME}"/.linuxbrew ]       && eval $("${HOME}"/.linuxbrew/bin/brew shellenv)
[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

## BASH COMPLETION
[ -f /usr/local/etc/bash_completion ]              && source /usr/local/etc/bash_completion
[ -r /usr/local/etc/profile.d/bash_completion.sh ] && source /usr/local/etc/profile.d/bash_completion.sh

## GO
[ -f "${HOME}"/.gimme/envs/latest.env ] && source "${HOME}"/.gimme/envs/latest.env

## CARGO
[ -d "${HOME}"/.cargo ] && source "${HOME}"/.cargo/env

## NODE
[ -s "${NVM_DIR}"/nvm.sh ] && source "${NVM_DIR}"/nvm.sh

## RBENV
command -v rbenv &>/dev/null && eval "$(rbenv init -)"

## FZF
[ -f "${HOME}"/.fzf.bash ] && source "${HOME}"/.fzf.bash

## Auto source env files
command -v direnv &>/dev/null && eval "$(direnv hook bash)"
[ -d "${HOME}"/.autoenv ]     && source "${HOME}"/.autoenv/activate.sh

# PROFILES & ALIASES
[ -f "${HOME}"/.aliases ]      && source "${HOME}"/.aliases
[ -f "${HOME}"/.work_profile ] && source "${HOME}"/.work_profile

# PROMPT
[ -f "${HOME}"/.bash_prompt ] && source "${HOME}"/.bash_prompt
