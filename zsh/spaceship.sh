#!/bin/bash

set -ex

mkdir -p ~/.zsh

git clone https://github.com/denysdovhan/spaceship-prompt.git $HOME/.zsh/spaceship-prompt

ln -sf "$HOME/.zsh/spaceship-prompt/spaceship.zsh" "$HOME/.zsh/prompt_spaceship_setup"

