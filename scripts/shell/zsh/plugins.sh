#!/bin/bash

set -e
set -x

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mkdir -p ~/.oh-my-zsh/custom/plugins/rustup && rustup completions zsh > ~/.oh-my-zsh/custom/plugins/rustup/_rustup
mkdir -p ~/.oh-my-zsh/custom/plugins/cargo && rustup completions zsh cargo > ~/.oh-my-zsh/custom/plugins/cargo/_cargo

[[ -f "$HOME/.zcompdump*" ]] && rm -rf "$HOME/.zcompdump*"
