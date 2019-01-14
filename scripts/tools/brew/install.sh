#!/bin/bash

set -e
set -x

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# From: https://docs.brew.sh/Linuxbrew
	if command -v apt &>/dev/null; then
		sudo apt update
		sudo apt install -y build-essential curl file git
	fi

	if command -v yum &>/dev/null; then
		sudo yum update -y
		sudo yum groupinstall 'Development Tools'
		sudo yum install curl file git
	fi

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
	echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

elif [[ "$OSTYPE" == "darwin"* ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
