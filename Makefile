.DEFAULT_GOAL := help
SHELL         := /bin/bash

UNAME       := $(shell uname -s | tr A-Z a-z)
PROJECT     := dotfiles
PROJECT_DIR ?= $(HOME)/Projects

-include makefiles/*.mk

## print help
.PHONY: help
help:
	@make2help $(MAKEFILE_LIST)

## symlink .config directory, e.g. alacritty, starship, git, neovim
.PHONY: link-config
link-config:
	$(RM) -r $(HOME)/.config
	ln -s $(CURDIR)/.config $(HOME)/.config

## symlink vim
.PHONY: link-vim
link-vim:
	$(RM) -r $(HOME)/.vim
	ln -s $(CURDIR)/.vim $(HOME)/.vim

## symlink neovim
.PHONY: link-neovim
link-neovim:
	mkdir -p $(HOME)/.config/nvim
	$(RM) -r $(HOME)/.config/nvim/init.vim
	ln -s $(CURDIR)/.vim/vimrc $(HOME)/.config/nvim/init.vim

## symlink bash
.PHONY: link-bash
link-bash:
	$(RM) -r $(HOME)/.{bash_profile,bash_prompt,inputrc,exports,functions,aliases}
	ln -s $(CURDIR)/.bash_profile $(HOME)/.bash_profile
	ln -s $(CURDIR)/.bash_prompt $(HOME)/.bash_prompt
	ln -s $(CURDIR)/.inputrc $(HOME)/.inputrc
	ln -s $(CURDIR)/.exports $(HOME)/.exports
	ln -s $(CURDIR)/.functions $(HOME)/.functions
	ln -s $(CURDIR)/.aliases $(HOME)/.aliases

## symlink tmux
.PHONY: link-tmux
link-tmux:
	$(RM) -r $(HOME)/.tmux.conf
	ln -s $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf

## symlink intellij files
.PHONY: link-ideavim
link-ideavim:
	$(RM) -r $(HOME)/.ideavimrc
	ln -s $(CURDIR)/intellij/.ideavimrc $(HOME)/.ideavimrc

## gh
.PHONY: gh
gh:
	git clone https://github.com/cli/cli $(PROJECT_DIR)/gh
	make install

## git-extras
.PHONY: git-extras
git-extras:
	gh repo clone https://github.com/tj/git-extras.git $(PROJECT_DIR)/git-extras
	git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
	make install

## direnv
.PHONY: direnv
direnv:
	gh release download --repo direnv/direnv --pattern "*.$(UNAME)-amd64"

# vim: ft=make
