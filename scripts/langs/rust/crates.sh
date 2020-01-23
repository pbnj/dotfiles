#!/bin/bash

set -e
set -x

# prerequisite dependencies
if command -v apt-get &>/dev/null; then
	sudo apt-get update
	sudo apt-get install -y \
		llvm \
		clang \
		build-essential
fi

if command -v yum &>/dev/null; then
	sudo yum update
	sudo yum install -y \
		llvm \
		llvm-devel \
		clang \
		clang-devel
	sudo yum groupinstall "Development Tools"
fi

cargo install exa bat ripgrep starship enquirer
