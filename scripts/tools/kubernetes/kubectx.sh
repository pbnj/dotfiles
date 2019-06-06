#!/bin/bash

set -e
set -x

KUBECTX_PATH="$HOME/.config/kubectx"

# Install
git clone https://github.com/ahmetb/kubectx "$KUBECTX_PATH"

# Completion
COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
ln -sf "$KUBECTX_PATH/completion/kubens.bash" "$COMPDIR/kubens"
ln -sf "$KUBECTX_PATH/completion/kubectx.bash" "$COMPDIR/kubectx"
