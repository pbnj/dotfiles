#!/bin/bash

set -e
set -x

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

nvm install --lts

echo "\tsource $HOME/.bash_profile"
