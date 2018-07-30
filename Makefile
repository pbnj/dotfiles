.DEFAULT_GOAL := help
.PHONY: all
all: bash neovim vim tmux git

.PHONY: bootstrap
	sh $(CURDIR)/bash/bootstrap.sh

.PHONY: bash
bash: ## Configures bash
	ln -sf $(CURDIR)/bash/.bash_profile $(HOME)/.bash_profile
	ln -sf $(CURDIR)/bash/.bash_prompt.simple $(HOME)/.bash_prompt
	ln -sf $(CURDIR)/bash/.bash_logout $(HOME)/.bash_logout
	ln -sf $(CURDIR)/bash/.inputrc $(HOME)/.inputrc
	ln -sf $(CURDIR)/bash/.bash_aliases $(HOME)/.bash_aliases

.PHONY: brew
brew: ## Installs homebrew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: neovim
neovim: ## configures neovim
	sh $(CURDIR)/vim/neovim/build.sh
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(CURDIR)/vim/.vimrc $(HOME)/.config/nvim/init.vim

.PHONY: vim
vim: ## configures vim
	ln -sf $(CURDIR)/vim/.vimrc $(HOME)/.vimrc
	sh $(CURDIR)/vim/build.sh

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	sh $(CURDIR)/vim/vim-plug.sh

.PHONY: tmux
tmux: ## Install tmux & config
	sh $(CURDIR)/tmux/build.sh
	ln -sf $(CURDIR)/tmux/.tmux.conf $(HOME)/.tmux.conf

GIT_VERSION = $(shell git version | cut -d" " -f3)
.PHONY: git
git: ## Configures git
	sh $(CURDIR)/git/install.sh
	curl -o $(HOME)/.git-prompt.sh https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-prompt.sh
	curl -o $(HOME)/.git-completion.bash https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-completion.bash
	ln -sf $(CURDIR)/git/.gitconfig $(HOME)/.gitconfig

GO_VERSION ?= "1.10.3"
GO_ARCH    ?= "linux-amd64"
.PHONY: go
go: ## installs go
	#mkdir -p $(HOME)/go
	#curl -LO https://storage.googleapis.com/golang/go$(GO_VERSION).$(GO_ARCH).tar.gz
	#sudo tar -C /usr/local -xzf go$(GO_VERSION).$(GO_ARCH).tar.gz
	sh $(CURDIR)/go/install.sh
	rm -rf $(CURDIR)/go$(GO_VERSION).$(GO_ARCH).tar.gz

.PHONY: rust
rust: ## installs rust
	sh <(curl https://sh.rustup.rs -sSf)

.PHONY: help
help: ## prints help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
