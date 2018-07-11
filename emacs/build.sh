#!/bin/bash

set -e
set -x

if command -v yum &>/dev/null; then
  yum install gcc make ncurses-devel giflib-devel libjpeg-devel libtiff-devel gnutls
fi

git clone --depth 1 git://git.sv.gnu.org/emacs.git $HOME/emacs

(
cd "$HOME/emacs"
./autogen.sh
./configure --without-x --without-selinux --without-gnutls
make
sudo make install
)
