.DEFAULT_GOAL := help

.PHONY: all
all: bash tmux git ssh neovim go node

.PHONY: bootstrap
	sh $(CURDIR)/scripts/bash/bootstrap.sh

.PHONY: bash
bash: ## Configures bash
	stow --dir=$(CURDIR)/bash

.PHONY: brew
brew: ## Install homebrew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: spacevim
spacevim: ## Install spacevim
	sh $(CURDIR)/scripts/spacevim/install.sh
	stow --dir=$(CURDIR)/spacevim

.PHONY: neovim
neovim: ## Install neovim
	sh $(CURDIR)/scripts/neovim/build.sh

.PHONY: vim
vim: ## Install vim
	sh $(CURDIR)/scripts/vim/build.sh

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	sh $(CURDIR)/scripts/vim-plug/install.sh

.PHONY: tmux
tmux: ## Install tmux
	sh $(CURDIR)/tmux/build.sh
	stow --dir=$(CURDIR)/tmux

GIT_VERSION = $(shell git version | cut -d" " -f3)
.PHONY: git
git: ## Install git
	sh $(CURDIR)/scripts/git/install.sh
	curl -o $(HOME)/.git-prompt.sh https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-prompt.sh
	stow --dir=$(CURDIR)/git

.PHONY: go
go: ## Install go
	sh $(CURDIR)/scripts/go/gimme.sh

.PHONY: node
nvm: ## Install Node Version Manager and Node
	sh $(CURDIR)/scripts/nvm/install.sh

.PHONY: help
help: ## prints help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
