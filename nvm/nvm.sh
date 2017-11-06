#!/bin/bash

set -e

echo "## INSTALLING NVM ##"
git clone https://github.com/creationix/nvm.git $HOME/.nvm

echo "## CONFIGURING ENV VARS ##"
echo '
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

echo "## TESTING NVM INSTALLATION ##"
nvm ls-remote

echo "## INSTALLING LATEST NODE ##"
nvm install node
npm i -g npm
