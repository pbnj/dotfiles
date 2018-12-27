#!/bin/bash

set -e
set -x

curl -L -o $HOME/.dotfiles/bash/.bash_completion.d/hub https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh
curl -L -o $HOME/.dotfiles/bash/.bash_completion.d/git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
