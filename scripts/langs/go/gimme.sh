#!/bin/bash

set -e
set -x

curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme --create-dirs

chmod +x ~/bin/gimme

~/bin/gimme stable
