UNAME := $(shell uname)

.PHONY: all
all: bash tmux git go nvm

.PHONY: bash
bash: stow ## Configures bash
	stow --dir=$(CURDIR)/bash

.PHONY: brew
brew: ## Install homebrew
ifeq ($(UNAME), Darwin) ## if OS is macOS
ifneq (, $(shell which brew)) ## if brew is not installed
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif
endif

.PHONY: neovim
neovim: stow ## Install neovim
	stow --dir=$(CURDIR)/neovim

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	sh $(CURDIR)/scripts/tools/vim/plug.sh

.PHONY: tmux
tmux: stow ## Install tmux
	stow --dir=$(CURDIR)/tmux

GIT_VERSION = $(shell git version | cut -d" " -f3)
.PHONY: git
git: stow ## Install git
	curl -o $(HOME)/.git-prompt.sh https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-prompt.sh
	stow --dir=$(CURDIR)/git

.PHONY: go
go: ## Install go
	sh $(CURDIR)/scripts/langs/go/gimme.sh

.PHONY: nvm
nvm: ## Install Node Version Manager and Node
ifeq (, $(shell which nvm))
	sh $(CURDIR)/scripts/langs/nvm/install.sh
endif

.PHONY: stow
stow: brew ## Installs stow
ifeq (, $(shell which brew))
	brew install stow
else
	sudo apt-get update
	sudo apt-get install -y stow
endif
