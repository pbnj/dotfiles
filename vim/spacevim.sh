#!/bin/bash

set -ex

curl -sLf https://spacevim.org/install.sh | bash
mkdir -p $HOME/.SpaceVim.d/
cp init.vim $HOME/.SpaceVim.d/init.vim
