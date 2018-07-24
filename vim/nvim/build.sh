#!/bin/bash

set -e
set -x

if command -v apt-get &>/dev/null; then
    sudo apt-get install -y \
        autoconf \
        automake \
        cmake \
        g++ \
        libtool \
        make \
        ninja-build \
        pkg-config \
        python3 \
        python3-pip \
        unzip
fi

if command -v yum &>/dev/null; then
    sudo yum -y install \
         autoconf \
         automake \
         cmake \
         gcc \
         gcc-c++ \
         libtool \
         make \
         ninja-build \
         pkgconfig \
         python34 \
         python34-pip \
         unzip
fi

git clone https://github.com/neovim/neovim "$HOME/neovim"

(
    cd "$HOME/neovim"
    make
    sudo make install
    rm -rf "$HOME/neovim"
)

pip3 install --upgarde pip --user
pip3 install --upgrade neovim --user
