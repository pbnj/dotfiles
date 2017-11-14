#!/bin/bash

set -ex

sudo apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip

if [ ! command -v rustup > /dev/null 2>&1 ];
then
    echo "Rust is missing. Please, install rust and re-execute this file."
    exit 1
fi

git clone https://github.com/jwilm/alacritty.git
cd alacritty

cargo build --release

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
cp Alacritty.desktop ~/.local/share/applications

cp alacritty.yml $HOME/.alacritty.yml
