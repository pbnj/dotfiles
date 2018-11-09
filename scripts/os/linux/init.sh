#!/bin/bash

set -e
set -x

if command -v apt &>/dev/null; then
	sudo apt update
	sudo apt install -y \
		build-essential \
		curl \
		git \
		make \
		python \
		python3 \
		ShellCheck
fi

if command -v yum &>/dev/null; then
	sudo yum update
	sudo yum groupinstall -y "Development Tools"
	sudo yum install -y \
		curl \
		epel-release \
		git \
		make \
		ShellCheck
fi
