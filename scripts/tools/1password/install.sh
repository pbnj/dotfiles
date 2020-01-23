#!/bin/bash

set -e
set -x

if ! command -v enquirer &>/dev/null; then
	echo "enquirer not installed. See https://github.com/termapps/enquirer"
	exit 1
fi

OP_VERSION="$(enquirer input --message "Version" -d "0.8.0")"
OP_PLATFORM="$(enquirer select --message "Platform" linux darwin windows)"
OP_ARCH="$(enquirer select --message "Architecture" amd64 arm)"

OP_ZIP="op_${OP_PLATFORM}_${OP_ARCH}_v${OP_VERSION}.zip"

curl -fsSL -o $HOME/$OP_ZIP https://cache.agilebits.com/dist/1P/op/pkg/v$OP_VERSION/$OP_ZIP
