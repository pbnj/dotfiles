#!/bin/bash

set -ex

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim

mkdir -p $HOME/.config/nvim/
cp ./init.vim $HOME/.config/nvim/init.vim
