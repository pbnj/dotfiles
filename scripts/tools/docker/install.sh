#!/bin/bash

set -e
set -x

curl https://get.docker.com

sudo usermod -aG docker $(whoami)
