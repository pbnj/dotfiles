#!/bin/bash

set -e
set -x

VERSION="$1"
OS="$(uname | tr '[:upper:]' '[:lower:]')"

if [ -z "$VERSION" ]; then
	VERSION="$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)"
fi

curl -LO https://storage.googleapis.com/kubernetes-release/release/"$VERSION"/bin/"$OS"/amd64/kubectl
chmod +x kubectl

