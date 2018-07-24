#!/bin/bash

set -e
set -x

if command -v apt-get &>/dev/null; then
sudo apt-get install -y \
	build-essential \
	libncurses-dev \
	libjpeg-dev \
	libpng-dev \
	libgif-dev \
	libtiff-dev
fi

EMACS_LATEST_VERSION="26.1"
EMACS_TAR_GZ=emacs-${EMACS_LATEST_VERSION}.tar.gz
curl -LO https://ftp.gnu.org/pub/gnu/emacs/${EMACS_TAR_GZ}
tar -C $HOME -zxvf ${EMACS_TAR_GZ}

(
cd $HOME/emacs*
./configure --with-x-toolkit=no --with-gnu-tls=no
make
sudo make install
)

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
