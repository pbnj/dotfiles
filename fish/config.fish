set -g theme_color_scheme light

bass source $HOME/.gimme/envs/latest.env

set -xg GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

set -x PATH /sbin $HOME/.local/bin $PATH

source $OMF_PATH/pkg/fish-ssh-agent/init.fish

abbr -a a ansible
abbr -a c clear
abbr -a d docker
abbr -a g git
abbr -a k kubectl
abbr -a s systemctl
abbr -a t terraform
abbr -a v vault

function l
    ls -alFh $argv
end
