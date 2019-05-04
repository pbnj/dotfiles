UNAME := $(shell uname)

.PHONY: all
all: bash tmux git go nvm

.PHONY: bash
bash: stow ## Configures bash
	stow --dir=$(CURDIR)/bash

.PHONY: rust
rust: ## Install rust toolchain
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	sh scripts/langs/rust/toolchain.sh
	sh scripts/langs/rust/cargo.sh

.PHONY: brew
brew: ## Install homebrew
ifeq ($(UNAME), Darwin) ## if OS is macOS
ifneq (, $(shell which brew)) ## if brew is not installed
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif
endif

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: neovim
neovim: ## Install neovim
	stow nvim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: install-neovim
install-neovim: ## Installs neovim
	sudo apt-get update
	sudo apt-get install software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim
	sudo apt-get install python-pip python3-pip
	pip install neovim
	pip3 install neovim

.PHONY: tmux
tmux: stow ## Install tmux
	stow --dir=$(CURDIR)/tmux

GIT_VERSION = $(shell git version | cut -d" " -f3)
.PHONY: git-prompt
git-prompt: ## Install git-prompt
	curl -o $(HOME)/.git-prompt.sh https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-prompt.sh

.PHONY: git
git: stow ## Install git
	sudo apt-get install software-properties-common python-software-properties
	sudo add-apt-repository ppa:git-core/ppa
	sudo apt-get update
	sudo apt-get install git
	stow --dir=$(CURDIR)/git

.PHONY: git-flow
git-flow: ## Install git-flow
	sudo apt install git-flow
	sudo curl -L -o /etc/bash_completion.d/git-flow-completion.bash https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash

.PHONY: go
GO_VERSION := $(shell curl -fsSL https://golang.org/VERSION?m=text)
GO_ARCH := linux-amd64
#https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
go: ## Install go
	curl -fsSL https://dl.google.com/go/$(GO_VERSION).$(GO_ARCH).tar.gz | sudo tar -vxzC /usr/local -f -

.PHONY: nvm
nvm: ## Install Node Version Manager and Node
ifeq (, $(shell which nvm))
	sh $(CURDIR)/scripts/langs/nvm/install.sh
endif

.PHONY: stow
stow: brew ## Installs stow
ifeq ($(OSTYPE), "Darwin")
	brew install stow
else
	sudo apt-get update
	sudo apt-get install -y stow
endif

.PHONY: fzf
fzf: ## Installs fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

.PHONY: kubectl
kubectl: ## Install kubectl
	./scripts/tools/kubernetes/kubectl.sh
