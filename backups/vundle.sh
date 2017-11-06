#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp _.vimrc ~/.vimrc

# install all vundle plugins
vim +PluginInstall +qall
