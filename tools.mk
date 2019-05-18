####################
# GIT
####################
.PHONY: git
git: ## Install git
ifeq ($(OSTYPE), "Darwin")
	brew install git
else
	sudo apt-get install software-properties-common
	sudo add-apt-repository ppa:git-core/ppa
	sudo apt-get update
	sudo apt-get install git
endif

GIT_VERSION = $(shell git version | cut -d" " -f3)
.PHONY: git-prompt
git-prompt: ## Install git-prompt
	curl -o $(CURDIR)/git/.git-prompt.sh \
		https://raw.githubusercontent.com/git/git/v$(GIT_VERSION)/contrib/completion/git-prompt.sh

.PHONY: hub
hub: ## Install hub cli
ifeq ($(OSTYPE), "Darwin")
	brew install hub
else
	mkdir -p "$(GOPATH)"/src/github.com/github
	git clone \
		--config transfer.fsckobjects=false \
		--config receive.fsckobjects=false \
		--config fetch.fsckobjects=false \
		https://github.com/github/hub.git "$(GOPATH)"/src/github.com/github/hub
	$(MAKE) -C "$(GOPATH)"/src/github.com/github/hub install prefix=/usr/local
endif

.PHONY: git-flow
git-flow: ## Install git-flow
	sudo apt install git-flow
	sudo curl -L -o /etc/bash_completion.d/git-flow-completion.bash \
		https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash

.PHONY: fzf
fzf: ## Install fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

####################
# KUBERNETES
####################
.PHONY: kubectl
kubectl: ## Install kubectl
	./scripts/tools/kubernetes/kubectl.sh

.PHONY: docker
docker: ## Install docker
	curl -fsSL https://get.docker.com | sh

####################
# MACOS
####################
.PHONY: brew
brew: ## Install homebrew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: brews
brews: ## Install brews
	brew install \
		cmake \
		coreutils \
		ctags \
		docker \
		docker-compose \
		fzf \
		git \
		go \
		htop \
		hub \
		hugo \
		jq \
		kubectl \
		make \
		mosh \
		neovim \
		ripgrep \
		shellcheck \
		tmux \
		vim \
		yamllint

.PHONY: brew-casks
brew-casks: ## Install brew casks
	brew cask install \
		1password-cli \
		docker \
		font-firacode-nerd-font \
		iterm2 \
		macvim \
		virtualbox \
		wkhtmltopdf

####################
# VIM
####################
.PHONY: vim-plug
vim-plug: ## Install vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: vim
vim: ## Install vim
	sh $(CURDIR)/scripts/tools/vim/build.sh

.PHONY: neovim
neovim: ## Install neovim
	sudo apt-get update
	sudo apt-get install software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim
	sudo apt-get install python-pip python3-pip
	pip install neovim
	pip3 install neovim

####################
# STOW
####################
.PHONY: stow
stow: ## Install stow
ifeq ($(OSTYPE), "Darwin")
	brew install stow
else
	sudo apt-get update
	sudo apt-get install -y stow
endif

.PHONY: stow-git
stow-git: ## Symlink git files to $HOME
	stow git

.PHONY: stow-tmux
stow-tmux: ## Symlink tmux files to $HOME
	stow tmux

.PHONY: stow-vim
stow-vim: ## Symlink vim files to $HOME
	stow vim

.PHONY: stow-neovim
stow-neovim: ## Symlink neovim files to $HOME
	stow nvim
