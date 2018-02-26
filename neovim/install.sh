#!/bin/bash

set -ex

curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv nvim.appimage $HOME
chmod u+x $HOME/nvim.appimage

mkdir -p $HOME/.config/nvim/
cp ./init.vim $HOME/.config/nvim/init.vim

nvim +PlugInstall
