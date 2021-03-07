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
	$(RM) -r $(HOME)/.config
	ln -s $(CURDIR)/.config $(HOME)/.config

## Symlink vim
.PHONY: link-vim
link-vim:
	$(RM) -r $(HOME)/.vim
	ln -s $(CURDIR)/.vim $(HOME)/.vim

## Symlink neovim
.PHONY: link-neovim
link-neovim:
	mkdir -p $(HOME)/.config/nvim
	$(RM) -r $(HOME)/.config/nvim/init.vim
	ln -s $(CURDIR)/.vim/vimrc $(HOME)/.config/nvim/init.vim

## Symlink bash
.PHONY: link-bash
link-bash:
	$(RM) -r $(HOME)/.{bash_profile,inputrc,exports,functions,aliases}
	ln -s $(CURDIR)/.bash_profile $(HOME)/.bash_profile
	ln -s $(CURDIR)/.bash_prompt $(HOME)/.bash_prompt
	ln -s $(CURDIR)/.inputrc $(HOME)/.inputrc
	ln -s $(CURDIR)/.exports $(HOME)/.exports
	ln -s $(CURDIR)/.functions $(HOME)/.functions
	ln -s $(CURDIR)/.aliases $(HOME)/.aliases

## Symlink tmux
.PHONY: link-tmux
link-tmux:
	$(RM) -r $(HOME)/.tmux.conf
	ln -s $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf

## Symlink intellij files
.PHONY: link-ideavim
link-ideavim:
	$(RM) -r $(HOME)/.ideavimrc
	ln -s $(CURDIR)/intellij/.ideavimrc $(HOME)/.ideavimrc

# vim: ft=make
