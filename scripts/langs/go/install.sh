#!/bin/bash

set -e
set -x

GO_VERSION="$(curl -fsSL https://golang.org/VERSION?m=text)" # latest by default
GO_OS="$(uname | tr '[:upper:]' '[:lower:]')"
GO_ARCH="amd64"
if [[ "$(lscpu | head -n 1 | awk '{print $2}')" == "arm"* ]]; then
	GO_ARCH="armv6l"
fi
GO_TAR="${GO_VERSION}.${GO_OS}-${GO_ARCH}.tar.gz"
GO_URL="https://dl.google.com/go/${GO_TAR}"

curl -fsSL ${GO_URL} | sudo tar -C /usr/local -vxzf -

echo ""
echo "export PATH=\$PATH:/usr/local/go/bin"
