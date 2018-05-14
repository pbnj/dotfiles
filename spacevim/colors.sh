#!/bin/bash

set -ex

mkdir -p $HOME/.SpaceVim.d/colors
cd $HOME/.SpaceVim.d/colors
git clone https://github.com/chriskempson/base16-vim.git base16
cp base16/colors/*.vim .
