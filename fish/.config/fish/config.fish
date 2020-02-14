####################
# PATH
####################
# GOPATH
set -Ux GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# CARGO
## TODO

# K8S
## TODO

# GENERAL
set -gx BAT_PAGER ""
set -gx BAT_THEME "GitHub"
set -gx DOTFILES "$HOME/.dotfiles"
set -gx EDITOR "nvim"
set -gx GIT_TERMINAL_PROMPT 1
set -gx MANPAGER "less -X"
set -gx TERM "xterm-256color"

####################
# SETTINGS
####################
fish_vi_key_bindings

####################
# THEME
####################
# cargo install starship
starship init fish | source
