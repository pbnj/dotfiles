.DEFAULT_GOAL := help

.PHONY: all
all: bash tmux git ssh neovim go node

.PHONY: bootstrap
	sh $(CURDIR)/bash/bootstrap.sh

.PHONY: bash
bash: ## Configures bash
	ln -sf $(CURDIR)/bash/.bash_profile $(HOME)/.bash_profile
	ln -sf $(CURDIR)/bash/.bash_prompt.simple $(HOME)/.bash_prompt
	ln -sf $(CURDIR)/bash/.inputrc $(HOME)/.inputrc
	ln -sf $(CURDIR)/bash/.bash_aliases $(HOME)/.bash_aliases

.PHONY: brew
brew: ## Install homebrew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: spacevim
spacevim: ## Install spacevim
	sh $(CURDIR)/vim/SpaceVim.d/install.sh
	cp -r $(CURDIR)/vim/SpaceVim.d $(HOME)/.SpaceVim.d

.PHONY: neovim
neovim: vim-plug ## Install neovim
	sh $(CURDIR)/vim/nvim/build.sh
	mkdir -p $(HOME)/.config
	ln -sf $(CURDIR)/vim/nvim $(HOME)/.config/nvim

.PHONY: vim
vim: ## Install vim
	ln -sf $(CURDIR)/vim/.vimrc $(HOME)/.vimrc
	sh $(CURDIR)/vim/build.sh

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	sh $(CURDIR)/vim/vim-plug.sh

.PHONY: tmux
tmux: ## Install tmux
	sh $(CURDIR)/tmux/build.sh
	ln -sf $(CURDIR)/tmux/.tmux.conf $(HOME)/.tmux.conf

GIT_VERSION = $(shell git version | cut -d" " -f3)
.PHONY: git
git: ## Install git
	sh $(CURDIR)/git/install.sh
	curl -o $(HOME)/.git-prompt.sh https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-prompt.sh
	curl -o $(HOME)/.git-completion.bash https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-completion.bash
	ln -sf $(CURDIR)/git/.gitconfig $(HOME)/.gitconfig

.PHONY: ssh
ssh: ## Configure ssh
	cp $(CURDIR)/ssh/config $(HOME)/.ssh/config

.PHONY: go
go: ## Install go
	sh $(CURDIR)/go/install.sh
	sh $(CURDIR)/go/install-pkgs.sh

.PHONY: rust
rust: ## Install rust
	sh <(curl https://sh.rustup.rs -sSf)

.PHONY: node
nvm: ## Install Node Version Manager and Node
	sh $(CURDIR)/nvm/install.sh
	sh $(CURDIR)/nvm/install-pkgs.sh

.PHONY: help
help: ## prints help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
