#!/bin/bash

set -e
set -x

if [ "$(uname)" == "Darwin" ]; then
	brew install stow
else
	command -v yum &>/dev/null && yum update && yum install -y stow
	command -v apt &>/dev/null && apt update && apt install -y stow
fi
