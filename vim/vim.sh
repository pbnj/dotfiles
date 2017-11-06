#!/bin/bash
set -e

echo "## INSTALLING VIM-PLUG..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

CWR="$(dirname $0)"

echo "### COPYING VIM CONFIG FILES TO ${HOME}..."
cp ${CWR}/vimrc ${HOME}/.vimrc

echo "### INSTALLING VIM PLUGINS..."
vim +PlugInstall!
