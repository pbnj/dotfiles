#!/usr/bin/env fish

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# install plugins in fishfile
cp ./fishfile ~/.config/fish/
fisher
