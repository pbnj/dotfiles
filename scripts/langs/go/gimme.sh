#!/bin/bash

set -e
set -x

curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme

chmod +x ~/bin/gimme

~/bin/gimme stable
