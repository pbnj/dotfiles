#!/bin/bash

set -e

echo "## INSTALLING VIM-PLUG..."

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

