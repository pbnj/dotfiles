#!/bin/bash

set -e
set -x

GO_LATEST="$(curl -fsSL https://golang.org/VERSION?m=text)"
GO_OS="$(uname | tr '[:upper]' '[:lower:]')"
GO_ARCH="amd64"
GO_TAR="${GO_LATEST}.${GO_OS}-${GO_ARCH}.tar.gz"
GO_URL="https://dl.google.com/go/${GO_TAR_GZ}"

curl -fsSL https://dl.google.com/go/$(curl -fsSL https://golang.org/VERSION?m=text).$(uname | tr '[:upper:]' '[:lower:]')-amd64.tar.gz | sudo tar -C /usr/local -vxzf -

echo "To complete Go install:"
echo "\texport PATH=$PATH:/usr/local/go/bin"
