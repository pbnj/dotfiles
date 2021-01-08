# Dotfiles

My configuration files. Here be dragons.

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Overview](#overview)
- [Install](#install)
  - [Pre-requisites](#pre-requisites)
  - [Stow](#stow)
  - [vim](#vim)
  - [etc](#etc)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Overview

```text
.
├── alacritty
├── bash
├── Brewfile
├── git
├── intellij
├── scripts
├── ssh
├── starship
├── templates
├── tmux
├── vim
└── vscode
```

## Install

### Pre-requisites

- [`brew`](https://brew.sh): `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- [`stow`](https://www.gnu.org/software/stow/): `brew install stow`

### Stow

Symlink config files to their expected locations:

```sh
stow {alacritty,bash,git,starship,tmux,vim}
```

### vim

- [`vim-plug`](https://github.com/junegunn/vim-plug):

  ```sh
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

### etc

The rest are simply installed via `brew`, directly from the project's website,
or built from source (see [`scripts/`](scripts) for various build and install
scripts)
