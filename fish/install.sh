#!/bin/bash

set -e
set -x

if command -v yum &>/dev/null;
then
    sudo yum update
    sudo yum install -y fish
fi

if command -v apt &>/dev/null;
then
    sudo apt update
    sudo apt install -y fish
fi
