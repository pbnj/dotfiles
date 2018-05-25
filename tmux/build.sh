#!/bin/bash

set -e

TMUX_HOME="$HOME/tmux"
git clone https://github.com/tmux/tmux "$TMUX_HOME"

cd "$TMUX_HOME"

command -v yum > /dev/null 2>&1 && sudo yum update -y && sudo yum install -y libevent-devel ncurses-devel
command -v apt-get > /dev/null 2>&1 && sudo apt-get update && sudo apt-get install -y libevent-dev ncurses-dev

sh autogen.sh && ./configure && make && sudo make install
sudo mv ./tmux /usr/local/bin/tmux
