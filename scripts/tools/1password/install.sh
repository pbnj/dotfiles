#!/bin/bash

set -e

DEFAULT_VERSION="0.9.0"
DEFAULT_PLATFORM="$(uname | tr '[:upper:]' '[:lower:]')"
DEFAULT_ARCH="$(uname -m | sed -e 's/x86_64/amd64/g')"

read -p "Version [${DEFAULT_VERSION}]: " OP_VERSION
read -p "Platform [${DEFAULT_PLATFORM}]: " OP_PLATFORM
read -p "Arch [${DEFAULT_ARCH//x86_64/amd64}]: " OP_ARCH

OP_VERSION=${OP_VERSION:-$DEFAULT_VERSION}
OP_PLATFORM=${OP_PLATFORM:-$DEFAULT_PLATFORM}
OP_ARCH=${OP_ARCH:-$DEFAULT_ARCH}

OP_ZIP="op_${OP_PLATFORM}_${OP_ARCH}_v${OP_VERSION}.zip"
OP_PATH="${HOME}/${OP_ZIP}"

echo "Downloading ${OP_ZIP}"
curl -fsSL -o $HOME/$OP_ZIP https://cache.agilebits.com/dist/1P/op/pkg/v$OP_VERSION/$OP_ZIP

if command -v unzip &>/dev/null; then
	echo "Unzipping ${OP_ZIP}"
	mkdir -p ${HOME}/bin
	unzip ${OP_PATH} op -d ${HOME}/bin
	rm -rf "${OP_PATH}"
fi
