#!/bin/bash

set -euxo pipefail

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# xcode tools (pre-req for homebrew)
# xcode-select --install

DIR=$(dirname $0)

# homebrew
./${DIR}/homebrew.sh

# install oh-my-zsh
./${DIR}/../zsh/oh_my_zsh.sh

# gpg tools
brew cask install gpgtools # not in brewfile due to bug caused by password prompt

# install terminal themes
# ./${DIR}/themes.sh

# install custom script
# cp install/osx/notify /usr/local/bin
# chmod +x /usr/local/bin/notify

# notify "Dotfiles installation complete!" "DOTFILES"
