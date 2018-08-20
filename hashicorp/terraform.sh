#!/bin/bash

set -e
set -x

curl -fsSL -o "$HOME/terraform.zip" https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
unzip "$HOME/terraform.zip"
sudo mv "$HOME/terraform" /usr/local/bin/
