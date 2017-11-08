#!/bin/bash

set -e

echo "## INSTALLING VIM-PLUG..."

# VIM
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# NEOVIM
curl -fLo ~/.config/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

