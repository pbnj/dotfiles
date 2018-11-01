#!/bin/bash

set -e
set -x

if command -v apt &>/dev/null
then
  sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
  sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev
  #Optional: so vim can be uninstalled again via `dpkg -r vim`
  sudo apt-get install checkinstall
fi

sudo rm -rf /usr/local/share/vim /usr/bin/vim

git clone https://github.com/vim/vim "$HOME/vim"
(
cd "$HOME/vim"
git pull
git fetch
cd src
make distclean
cd ..

./configure \
  --enable-multibyte \
  --enable-perlinterp=dynamic \
  --enable-python3interp \
  --enable-luainterp \
  --with-luajit \
  --enable-cscope \
  --enable-gui=auto \
  --with-features=huge \
  --with-x \
  --enable-fontset \
  --enable-largefile \
  --disable-netbeans \
  --with-compiledby="Peter Benjamin" \
  --enable-fail-if-missing \
  --prefix=/usr/local/bin

make
sudo make install
)

