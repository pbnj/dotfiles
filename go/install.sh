#!/bin/bash

set -e
set -x

GO_STABLE_VERSION="$(curl https://golang.org/VERSION?m=text)"
GO_TAR_GZ="${GO_STABLE_VERSION}.linux-amd64.tar.gz"
GO_URL_DL="https://dl.google.com/go/${GO_TAR_GZ}"

curl -LO "${GO_URL_DL}"
sudo tar -C /usr/local -xzvf $GO_TAR_GZ

echo "To complete Go install, run:"
echo "\tsource $HOME/.bash_profile"
