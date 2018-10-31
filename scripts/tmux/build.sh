#!/bin/bash

set -e

echo "Remove old versions"
sudo apt-get remove --purge -y tmux

TMUX_HOME="$HOME/tmux"
git clone https://github.com/tmux/tmux "$TMUX_HOME"

command -v yum &>/dev/null && sudo yum update -y && sudo yum install -y libevent-devel ncurses-devel automake build-essential pkg-config
command -v apt-get &>/dev/null && sudo apt-get update && sudo apt-get install -y libevent-dev ncurses-dev automake build-essential pkg-config
command -v brew &>/dev/null && brew install tmux && exit 0

(
	cd "$TMUX_HOME"
	sh autogen.sh && ./configure && make && sudo make install
	sudo mv ./tmux /usr/local/bin/tmux
)
