#!/bin/bash

set -e
set -x

if command -v brew &>/dev/null; then
	brew install zsh
fi
