#!/bin/bash

set -e
set -x

curl -sLf https://spacevim.org/install.sh | bash
rm -rf "$HOME/.vimrc"

if command -v pip3 &> /dev/null; then
  pip3 install --user --upgrade neovim
else
  pip install --user --upgrade neovim
fi
