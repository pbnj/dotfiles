#!/bin/bash

set -e
set -x

mkdir -p "$HOME/bin"

curl -L -o ~/bin/nvim https://github.com/neovim/neovim/releases/download/stable/nvim.appimage --create-dirs
chmod u+x ~/bin/nvim
