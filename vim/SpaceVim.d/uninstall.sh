#!/bin/bash

set -e
set -x

curl -sLf https://spacevim.org/install.sh | bash -s -- uninstall

rm -rf ~/.vim
rm -rf ~/.config/nvim
rm -rf ~/.SpaceVim
rm -rf ~/.SpaceVim.d
rm -rf ~/.cache/SpaceVim
rm -rf ~/.cache/vimfiles
