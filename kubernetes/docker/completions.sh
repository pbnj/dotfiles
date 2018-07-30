#!/bin/bash

set -e
set -x

if [ "$(uname)" = "Darwin" ]; then
  if [ ! -d /usr/local/etc/bash_completion.d ]; then
    command -v brew &>/dev/null && brew install bash-completion
  fi

  for name in "docker-compose.bash-completion" "docker-machine.bash-completion" "docker.bash-completion"
  do
    ln -sf /Applications/Docker.app/Contents/Resources/etc/$name /usr/local/etc/bash_completion.d/$name
  done
fi
