#!/bin/bash

set -e
set -x

mkdir -p $HOME/Projects

git clone https://github.com/mattly/iterm-colors-pencil \
	$HOME/Projects/iterm-colors-pencil

open $HOME/Projects/iterm-colors-pencil/pencil-{dark,light}.itermcolors
