#!/bin/bash

set -e
set -x

echo "## Install (neo)vim external plugin deps..."
if command -v yum &>/dev/null; then
	echo "### Installing ShellCheck..."
	sudo yum update
	sudo yum -y install epel-release
	sudo yum -y install ShellCheck
fi

if command -v go &>/dev/null; then
	echo "### Installing shfmt..."
	go get -u mvdan.cc/sh/cmd/shfmt
fi
