#!/bin/bash

set -e
set -x

if ! command -v docker &>/dev/null; then
  command -v brew &>/dev/null && brew install docker
  command -v brew &>/dev/null && brew cask install docker
fi

