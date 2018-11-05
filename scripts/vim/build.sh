#!/bin/bash

set -e
set -x

if command -v apt &>/dev/null; then
	sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
	sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev
	#Optional: so vim can be uninstalled again via `dpkg -r vim`
	sudo apt-get install checkinstall
fi

if command -v yum &>/dev/null; then
	sudo yum update
	sudo yum groupinstall 'Development tools'
	sudo yum install -y \
		ctags \
		git \
		lua \
		lua-devel \
		luajit \
		luajit-devel \
		ncurses \
		ncurses-devel \
		perl \
		perl-ExtUtils-CBuilder \
		perl-ExtUtils-Embed \
		perl-ExtUtils-ParseXS \
		perl-ExtUtils-XSpp \
		perl-devel \
		python \
		python-devel \
		python3 \
		python3-devel \
		ruby \
		ruby-devel \
		tcl-devel
fi

sudo rm -rf /usr/local/share/vim /usr/bin/vim

git clone https://github.com/vim/vim "$HOME/vim"
(
	cd "$HOME/vim"
	git pull
	git fetch

	./configure \
		--disable-netbeans \
		--enable-cscope \
		--enable-fail-if-missing \
		--enable-fontset \
		--enable-gui=auto \
		--enable-largefile \
		--enable-luainterp \
		--enable-multibyte \
		--enable-perlinterp=dynamic \
		--enable-python3interp \
		--prefix=/usr/local \
		--with-compiledby="Peter Benjamin" \
		--with-features=huge \
		--with-luajit \
		--with-tlib=ncurses \
		--without-x

	make
	sudo make install
)
