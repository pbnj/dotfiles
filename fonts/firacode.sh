#!/bin/bash -e
VERSION=$(curl https://github.com/tonsky/FiraCode/releases/latest/ | grep -o -E "([0-9])\.([0-9])+")
curl -L https://github.com/tonsky/FiraCode/releases/download/${VERSION}/FiraCode_${VERSION}.zip -o ~/Downloads/firacode_${VERSION}.zip
unzip ~/Downloads/firacode_${VERSION}.zip -d ~/Downloads/firacode_${VERSION}

if type open > /dev/null ; then
  open ~/Downloads/firacode_${VERSION}/otf/FiraCode-Light.otf
elif type xdg-open > /dev/null ; then
  xdg-open ~/Downloads/firacode_${VERSION}/otf/FiraCode-Light.otf
else
  echo "Could not open or install $HOME/Downloads/firacode_${VERSION}/otf/FiraCode-Light.otf"
  echo "Please, cd $HOME/Downloads/firacode_${VERSION}/otf/ and install FiraCode font manually."
fi
