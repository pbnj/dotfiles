#!/bin/bash

set -e
set -x

curl -fsSLO https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/gh-md-toc
chmod +x ./gh-md-toc
sudo mv ./gh-md-toc /usr/local/bin
