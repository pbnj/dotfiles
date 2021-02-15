# aliases
source $HOME/.config/fish/aliases.fish
# exports
source $HOME/.config/fish/exports.fish

# rbenv
rbenv init - | source

# direnv
direnv hook fish | source
# starship
starship init fish | source
