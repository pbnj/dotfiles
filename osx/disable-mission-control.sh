#!/bin/bash

set -e
set -x

defaults write com.apple.dock mcx-expose-disabled -bool TRUE
killall Dock
