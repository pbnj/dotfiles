#!/bin/bash

set -e

curl -L https://bit.ly/janus-bootstrap | bash

mkdir -p ~/.janus

git clone https://github.com/dracula/vim ~/.janus/dracula-vim
git clone https://github.com/vim-airline/vim-airline ~/.janus/vim-airline
git clone https://github.com/fatih/vim-go ~/.janus/vim-go
git clone https://github.com/editorconfig/editorconfig-vim ~/.janus/editorconfig-vim

DIR=$(dirname $0)
cp ${DIR}/_.vimrc.after ${HOME}/.vimrc.after
cp ${DIR}/_.vimrc.before ${HOME}/.vimrc.before

