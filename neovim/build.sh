#!/bin/bash

set -e

git clone https://github.com/neovim/neovim $HOME

cd $HOME/neovim

command -v apt-get > /dev/null 2>&1 && sudo apt-get install -y ninja-build libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
command -v yum > /dev/null 2>&1 && sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip

make
