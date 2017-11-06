#!/usr/bin/env bash
set -ex

CWD="$(dirname $0)"
DOTFILES_ROOT="$CWD/../.."

cp ${DOTFILES_ROOT}/aliases/aliases.sh ~/.bash_aliases

echo "# CONFIGURING GIT..."
cp ${CWR}/git/git-completion.bash ~/.git-completion.bash && echo "source ~/.git-completion.bash" >> ~/.bash_profile

echo "# CONFIGURING VIM..."
./${DOTFILES_ROOT}/vim/vim.sh

echo "# CONFIGURING GO..."
./${DOTFILES_ROOT}/go/go.sh

echo "# FINISHED SETTING UP C9!"
