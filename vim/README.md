# VIM

## Table of Contents

<!-- vim-markdown-toc GFM -->

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Managing Packages](#managing-packages)
- [Update Packages](#update-packages)
- [Remove Packages](#remove-packages)
- [Manual](#manual)
  - [Initialize](#initialize)
- [References](#references)

<!-- vim-markdown-toc -->

## Prerequisites

- Required:
  - Vim 8
  - git
- Optional:
  - GNU stow

## Getting Started

```sh
git clone https://github.com/petermbenjamin/dotfiles $HOME/.dotfiles
stow vim
```

## Managing Packages

```sh
git submodule add https://github.com/<$PACKAGE_NAME> vim/pack/foo/start/<$PACKAGE_NAME>
git add -A .
git commit
```

## Update Packages

```sh
git submodule update --remote --merge
git commit
```

## Remove Packages

```sh
git submodule deinit vim/pack/foo/start/<$PACKAGE_NAME>
git rm vim/pack/foo/start/<$PACKAGE_NAME>
rm -rf .git/modules/vim/pack/foo/start/<$PACKAGE_NAME>
git commit
```

## Manual

To manually install plugins without git submodules

### Initialize

```sh
mkdir -p ~/.vim/pack/foo/start # where `foo` is any name you want
git clone https://github.com/$USER/$PACKAGE ~/.vim/pack/foo/start/$PACKAGE
```

## References

- https://shapeshed.com/vim-packages/
- https://dvonrohr.com/2016/12/11/vim-package-manager/
