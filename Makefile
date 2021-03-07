.DEFAULT_GOAL := help
SHELL         := /bin/bash

PROJECT := dotfiles

-include makefiles/*.mk

## Print help
.PHONY: help
help:
	@make2help $(MAKEFILE_LIST)

## Symlink .config directory, e.g. alacritty, starship, git, neovim
.PHONY: link-config
link-config:
	$(RM) -rf $(HOME)/.config
	ln -s $(CURDIR)/.config $(HOME)/.config

## Symlink vim
.PHONY: link-vim
link-vim:
	$(RM) -rf $(HOME)/.vim
	ln -s $(CURDIR)/.vim $(HOME)/.vim

## Symlink bash
.PHONY: link-bash
link-bash:
	$(RM) -rf $(HOME)/.{bash_profile,inputrc,exports,functions,aliases}
	ln -s $(CURDIR)/.bash_profile $(HOME)/.bash_profile
	ln -s $(CURDIR)/.inputrc $(HOME)/.inputrc
	ln -s $(CURDIR)/.exports $(HOME)/.exports
	ln -s $(CURDIR)/.functions $(HOME)/.functions
	ln -s $(CURDIR)/.aliases $(HOME)/.aliases

## Symlink tmux
.PHONY: link-tmux
link-tmux:
	$(RM) -rf $(HOME)/.tmux.conf
	ln -s $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf

## Symlink intellij files
.PHONY: link-ideavim
link-ideavim:
	$(RM) -rf $(HOME)/.ideavimrc
	ln -s $(CURDIR)/intellij/.ideavimrc $(HOME)/.ideavimrc

# vim: ft=make
