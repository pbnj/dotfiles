#!/bin/bash

set -e
set -x

if command -v go &> /dev/null; then
	git clone https://github.com/gohugoio/hugo $HOME/hugo
	cd $HOME/hugo
	go install
else
	echo "Please, install Go first, then reinstall hugo."
fi
