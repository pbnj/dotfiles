#!/bin/bash

set -ex

# iTerm Themes
ITERM_THEME_DIR="$HOME/iterm/themes"
mkdir -p "$ITERM_THEME_DIR"
git clone https://github.com/MartinSeeler/iterm2-material-design $ITERM_THEME_DIR/material-design
git clone https://github.com/chriskempson/base16-iterm2 $ITERM_THEME_DIR/base16
git clone https://github.com/dracula/iterm $ITERM_THEME_DIR/dracula

# Terminal.app Themes
mkdir -p $HOME/terminal-app/themes
