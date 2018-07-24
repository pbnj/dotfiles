#!/bin/bash

set -e
set -x

sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git -y

ln -sf $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig
