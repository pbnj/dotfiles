#!/bin/bash

set -e
set -x

if command -v docker &>/dev/null
then
	exit 1
fi

if [ "$(uname)" == "Darwin" ]
then
  command -v brew &>/dev/null && brew install docker
  command -v brew &>/dev/null && brew cask install docker
fi

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
