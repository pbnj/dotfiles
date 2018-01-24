#!/bin/bash

set -ex

echo "## CREATING GO WORKSPACE..."
mkdir -p ${HOME}/go/src
mkdir -p ${HOME}/go/bin

echo "## INSTALLING LATEST GO..."
curl -o go-latest.tar.gz https://storage.googleapis.com/golang/go1.9.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go-latest.tar.gz
rm go-latest.tar.gz

echo "## EXPORTING ENV VARS..."

# BASH_PROFILE=${HOME}/.bash_profile
# echo 'export GOROOT=/usr/local/go' >> $BASH_PROFILE
# echo 'export GOPATH=${HOME}/go' >> $BASH_PROFILE
# echo 'export PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}' >> $BASH_PROFILE

# source $BASH_PROFILE

echo "## FINISHED INSTALLING GO!"

# CURRENT_DIR="$(dirname $0)"
# ${CURRENT_DIR}/packages.sh

