#!/usr/bin/env bash
set -e

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent

bash-it enable completion awscli brew docker-compose docker git go hub kubectl makefile npm nvm ssh vagrant
bash-it enable plugin hub
bash-it enable alias docker docker-compose curl git homebrew-cask homebrew
