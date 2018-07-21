#!/bin/bash

set -e
set -x

sudo curl -sL -o /usr/local/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
sudo chmod +x /usr/local/bin/gimme

gimme stable
source "$HOME/.gimme/envs/latest.env"
