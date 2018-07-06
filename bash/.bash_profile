##### SETTINGS #####
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}
do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Prevent bash from escaping '$' when bash-completion is installed and <TAB> is pressed
shopt -s direxpand

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar
do
  shopt -s "$option" 2> /dev/null
done

## COMPLETION ##
# Add tab completion for many Bash commands
# for file in /usr/local/etc/bash_completion.d/*; do
# [ -r "$file" ] && [ -f "$file" ] && source "$file"
# done
# unset file
# For bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# For bash-completion@2
# if [ -f /usr/local/share/bash-completion/bash_completion ]
# then
# . /usr/local/share/bash-completion/bash_completion
# fi

## RUST ##
if [ -d "$HOME/.cargo" ]
then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

## GO ##
if [ -d "/usr/local/go" ]
then
  export PATH="/usr/local/go/bin:$HOME/go/bin:$PATH"
fi

## NVM ##
if [ -d "$HOME/.nvm" ]
then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

## HUB ##
if command -v hub &>/dev/null
then
  eval "$(hub alias -s)"
fi

## GIT ##
if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]
then
  source "/usr/local/etc/bash_completion.d/git-completion.bash"
fi
## Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]
then
  complete -o default -o nospace -F _git g
fi

## SSH ##
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

[ -z "$SSH_AUTH_SOCK" ] && eval $(ssh-agent -s)
[ -z "$(ssh-add -l | grep SHA)" ] && ssh-add

## BREW ##
if [ -f "$HOME/.config/brew" ]
then
  source "$HOME/.config/brew"
fi

## KUBECTL ##
if command -v kubectl &>/dev/null
then
  source <(kubectl completion bash)
fi

## MINIKUBE ##
if command -v minikube &>/dev/null
then
  source <(minikube completion bash)
fi

## FZF ##
if [ -f ~/.fzf.bash ]
then
  source ~/.fzf.bash
fi

## VAULT ##
if command -v vault &>/dev/null
then
  complete -C /usr/local/bin/vault vault
fi
