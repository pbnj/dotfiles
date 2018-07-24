#!/bin/bash

set -e
set -x

git clone https://github.com/git/git $HOME/git

(
    cd $HOME/git
    make configure
    ./configure --prefix=/usr
    make
    sudo make install
    rm -rf $HOME/git
)
