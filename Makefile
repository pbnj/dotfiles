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
	stow --dir=$(CURDIR)/neovim

.PHONY: vim
vim: ## Install vim
	stow --dir=$(CURDIR)/vim

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	sh $(CURDIR)/scripts/tools/vim/plug.sh

.PHONY: tmux
tmux: ## Install tmux
	stow --dir=$(CURDIR)/tmux

GIT_VERSION = $(shell git version | cut -d" " -f3)
.PHONY: git
git: ## Install git
	curl -o $(HOME)/.git-prompt.sh https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-prompt.sh
	stow --dir=$(CURDIR)/git

.PHONY: go
go: ## Install go
	sh $(CURDIR)/scripts/langs/go/gimme.sh

.PHONY: node
nvm: ## Install Node Version Manager and Node
	sh $(CURDIR)/scripts/langs/nvm/install.sh

.PHONY: help
help: ## prints help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
