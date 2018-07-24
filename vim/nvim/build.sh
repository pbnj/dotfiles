#!/bin/bash

set -e
set -x

git clone https://github.com/neovim/neovim "$HOME/neovim"

(
cd "$HOME/neovim"

if command -v apt-get &>/dev/null; then
  sudo apt-get install -y ninja-build libtool autoconf automake cmake make g++ pkg-config unzip python3 python3-pip
fi

if command -v yum &>/dev/null; then
  sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip python3 python3-pip
fi

make
sudo make install
)
