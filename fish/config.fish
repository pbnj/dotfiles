set -g theme_color_scheme light

bass source $HOME/.gimme/envs/latest.env

set -xg GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

source $OMF_PATH/pkg/fish-ssh-agent/init.fish

function l
    ls -alFh $argv
end
