#!/bin/bash

set -e
set -x

# command -v apt-get &>/dev/null && sudo apt-get install build-essential
# command -v yum &>/dev/null && sudo yum groupinstall “Development Tools”

wget http://ftp.gnu.org/gnu/bash/bash-4.4.tar.gz
tar xf bash-4.4.tar.gz
(
  cd bash-4.4
  ./configure
  make
  sudo make install
)
