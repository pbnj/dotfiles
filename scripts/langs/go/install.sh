#!/bin/bash

set -e
set -x

GO_VERSION="$(curl -fsSL https://golang.org/VERSION?m=text)" # latest by default
GO_OS="$(uname | tr '[:upper:]' '[:lower:]')"
GO_ARCH="amd64"
GO_TAR="${GO_VERSION}.${GO_OS}-${GO_ARCH}.tar.gz"
GO_URL="https://dl.google.com/go/${GO_TAR_GZ}"

curl -fsSL ${GO_URL} | sudo tar -C /usr/local -vxzf -

echo "To complete Go install:"
echo "\texport PATH=$PATH:/usr/local/go/bin"
