#!/bin/bash

set -e
set -x

command -v brew &>/dev/null && brew install docker
command -v brew &>/dev/null && brew cask install docker
