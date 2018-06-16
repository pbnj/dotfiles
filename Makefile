.DEFAULT_GOAL := help
.PHONY: all
all: neovim vim tmux git

.PHONY: neovim
neovim: ## configures neovim
	@ln -sf $(CURDIR)/neovim/init.vim $(HOME)/.config/nvim/init.vim

.PHONY: vim
vim: ## configures vim
	@ln -sf $(CURDIR)/neovim/init.vim $(HOME)/.vimrc

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	sh $(CURDIR)/vim/vim-plug.sh

.PHONY: tmux
tmux: ## Install tmux & config
	sh $(CURDIR)/tmux/build.sh
	sh $(CURDIR)/tmux/tmux-plugins.sh
	ln -sf $(CURDIR)/tmux/.tmux.conf $(HOME)/.tmux.conf

.PHONY: git
git: ## Configures git
	curl -o $(HOME)/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
	curl -o $(HOME)/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	ln -sf $(CURDIR)/git/.gitconfig $(HOME)/.gitconfig

.PHONY: go
go: ## installs go
	mkdir -p $(HOME)/go
	curl -LO https://storage.googleapis.com/golang/go1.10.3.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz
	rm -rf go1.10.3.linux-amd64.tar.gz

.PHONY: help
help: ## prints help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
