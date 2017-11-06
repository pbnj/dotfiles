#!/usr/bin/env bash

# install deps
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# add repo
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update

# Test installation
apt-cache policy docker-engine

# Install deps
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

# Install docker
sudo apt-get install docker-engine

# Test docker
sudo docker run hello-world
