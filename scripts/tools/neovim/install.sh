#!/bin/bash

set -ex

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
