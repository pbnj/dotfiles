#!/bin/bash

set -e
set -x

curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

source $HOME/.nvm/nvm.sh

nvm install --lts

npm i -g npm@latest prettier doctoc git-open
