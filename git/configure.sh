#!/bin/bash

set -e
set -x

GIT_VERSION="$(git version | cut -d " " -f 3)"

curl -o $HOME/.git-prompt.sh https://raw.githubusercontent.com/git/git/v$GIT_VERSION/contrib/completion/git-prompt.sh
curl -o $HOME/.git-completion.bash https://raw.githubusercontent.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash
ln -sf $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig
