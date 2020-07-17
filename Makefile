.DEFAULT_GOAL := help
SHELL := /bin/bash

PROJECT := dotfiles

include makefile-rust.mk
include makefile-go.mk

.PHONY: help
help: ## Print help
	@grep -oh -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s	%s\n", $$1, $$2}'

################################################################################
# BOOTSTRAP DEV CONTAINER
################################################################################
.PHONY: dev-container
dev-container: ## Run dev container
	docker run \
		--rm \
		-it \
		--volume $(PWD):/$(PROJECT) \
		--workdir /$(PROJECT) \
		ubuntu:20.04

.PHONY: dev
dev: apt-update ## Setup dev container from scratch. Use -j8 flag for parallel threads.
	$(MAKE) install-deps
	$(MAKE) -j8 vim-plug node go rust crate-deps stow
	$(MAKE) -j8 crates vim-plugs

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	./scripts/tools/neovim/vim-plug.sh

.PHONY: vim-plugs
vim-plugs: ## Install vim plugins
	source $(HOME)/.nvm/nvm.sh \
		&& nvim --headless +PlugInstall +qall \
		&& nvim --headless +CocUpdateSync +qall

.PHONY: node
node: ## Install node.js
	./scripts/langs/nvm/install.sh

.PHONY: apt-update
apt-update: ## Run apt-get update
	apt-get update

.PHONY: install-deps
install-deps: apt-update ## Install dependencies. Must run manually first.
	apt-get install -y \
		ca-certificates \
		curl \
		git \
		neovim \
		python3-neovim \
		stow \
		tmux \
		vim

################################################################################
# STOW
################################################################################
.PHONY: stow
stow: stow-git stow-tmux stow-bash stow-vim ## Symlink files

.PHONY: stow-git
stow-git: ## Stow git
	stow git

.PHONY: stow-tmux
stow-tmux: ## Stow tmux
	stow tmux

.PHONY: stow-bash
stow-bash: ## Stow bash
	stow bash

.PHONY: stow-vim
stow-vim: ## Stow git
	stow vim

.PHONY: stow-starship
stow-starship: ## Stow starship
	stow starship
