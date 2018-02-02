#!/bin/bash

set -e

mkdir -p $HOME/.config/nvim/
cp ../.config/nvim/init.vim $HOME/.config/nvim/init.vim

nvim +PlugInstall
