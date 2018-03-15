#!/bin/bash

set -e

git clone https://github.com/tmux/tmux $HOME/tmux

cd $HOME/tmux

command -v yum > /dev/null 2>&1 && sudo yum install -y libevent-devel ncurses-devel
command -v apt-get > /dev/null 2>&1 && sudo apt-get install -y libevent-dev ncurses-dev

sh autogen.sh
./configure && make && sudo make install
sudo mv ./tmux /usr/local/bin/tmux
