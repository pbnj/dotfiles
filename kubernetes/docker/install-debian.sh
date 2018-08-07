#!/bin/bash

set -e
set -x

sudo apt-get remove docker docker-engine docker.io
sudo apt-get update

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce

