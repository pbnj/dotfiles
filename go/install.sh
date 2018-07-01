#!/bin/bash

set -e
set -x

curl -LO https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz
rm -rf go1.10.3.linux-amd64.tar.gz
