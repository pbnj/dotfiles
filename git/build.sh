#!/bin/bash

set -e
set -x

git clone https://github.com/git/git $HOME/git

sudo apt-get install -y zlib1g-dev curl libcurl4-openssl-dev libexpat1-dev gettext zlib1g-dev

(
    cd $HOME/git
    make configure
    ./configure --prefix=/usr
    make
    sudo make install
    rm -rf $HOME/git
)
