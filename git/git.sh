#!/bin/bash

set -e

CWR="$(dirname $0)"

echo "## COPYING CONFIG FILES TO ${HOME}..."
cp ${CWR}/git/gitconfig ~/.gitconfig
cp ${CWR}/git/gitignore_global ~/.gitignore_global
cp ${CWR}/git/git-completion.bash ~/.git-completion.bash && echo "source ~/.git-completion.bash" >> ~/.bash_profile
. ~/.bash_profile
