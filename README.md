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
├── .aliases
├── .bash_profile
├── .bash_prompt
├── .config
│  ├── alacritty
│  ├── git
│  ├── nvim
│  ├── starship.toml
│  └── yarn
├── .exports
├── .functions
├── .inputrc
├── .ssh
│  └── config
├── .tmux.conf
├── .vim
│  └── vimrc
├── Brewfile
├── intellij
│  └── .ideavimrc
├── Makefile
├── templates
│  ├── commitlint
│  ├── editorconfig
│  ├── husky
│  ├── lintstaged
│  ├── markdownlint
│  ├── prettier
│  ├── semantic-release
│  └── yamllint
└── vscode
   ├── extensions.txt
   ├── keybindings.json
   ├── settings.json
   └── tasks.json
```

## Install

### Pre-requisites

- [`brew`](https://brew.sh): `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### Symlink

Symlink config files to their expected locations:

```sh
make link-bash link-config link-vim link-neovim link-tmux
```

### vim

vim-plug and plugins will be installed at first launch

### templates

These are common configuration files used across projects, such as:

- `.markdownlint.yaml`
- `.yamllint.yaml`
- `.prettierrc.yaml`
- `.release.yaml`
- `.huskyrc.yaml`
- `.lintstagedrc.yaml`
- `.commitlint.yaml`
- `.editorconfig`

### misc

The rest are simply installed via `brew`, directly from the project's website,
or built from source (see [`scripts/`](scripts) for various build and install
scripts)
