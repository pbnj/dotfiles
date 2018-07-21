#!/bin/bash

set -e
set -x

if [ $(uname) = "Linux" ]; then
    sudo curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
fi

if [ $(uname) = "Darwin" ]; then
    sudo curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
fi

sudo chmod +x /usr/local/bin/kubectl
source <(kubectl completion bash)
