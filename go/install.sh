#!/bin/bash -eux

GO_LATEST="go1.10"

GO_ARCH="linux-amd64.tar.gz"
[ $(uname) = "Darwin" ] && GO_ARCH="darwin-amd64.pkg"

echo "## CREATING GO WORKSPACE..."
mkdir -p $HOME/go/src
mkdir -p $HOME/go/bin

echo "## INSTALLING LATEST GO..."
curl -LO https://storage.googleapis.com/golang/$GO_LATEST.$GO_ARCH
if [ $(uname) = "Darwin" ]; then
    open $GO_LATEST.$GO_ARCH
else
    sudo tar -C /usr/local -xzf $GO_LATEST.$GO_ARCH
fi

echo "## FINISHED INSTALLING GO!"
