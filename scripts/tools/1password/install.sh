#!/bin/bash

set -e
set -x

OP_VERSION="0.6.1"
OP_ARCH="arm"
if [[ "$(lscpu | grep Architecture | awk '{print $2}')" == "x86_64" ]]; then
	OP_ARCH="amd64"
fi

OP_ZIP="op_linux_${OP_ARCH}_v${OP_VERSION}.zip"

curl -fsSL -o $HOME/$OP_ZIP https://cache.agilebits.com/dist/1P/op/pkg/v$OP_VERSION/$OP_ZIP
