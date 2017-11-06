#!/bin/bash

# For more, see https://draculatheme.com/

set -e

mkdir -p ${HOME}/Projects/github

# Hyper Theme
# hpm install hyper-dracula

# iTerm Theme
git clone https://github.com/dracula/iterm.git ${HOME}/Projects/github/dracula-iterm
open ${HOME}/Projects/github/dracula-iterm/*.itermcolors

# Terminal Theme
git clone https://github.com/dracula/terminal.app.git ${HOME}/Projects/github/dracula-terminal
open ${HOME}/Projects/github/dracula-terminal/*.terminal
