#!/bin/bash

set -e
set -x

GIT_VERSION="v$(git version | cut -d' ' -f3)"

curl -lo "$HOME/.git-prompt.sh" https://raw.githubusercontent.com/git/git/$GIT_VERSION/contrib/completion/git-prompt.sh
