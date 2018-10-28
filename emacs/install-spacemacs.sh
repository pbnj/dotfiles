#!/bin/bash

set -e
set -x

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

ln -sf $HOME/.dotfiles/emacs/.spacemacs $HOME/.spacemacs

emacs --insecure
