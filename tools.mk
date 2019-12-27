####################
# 1PASSWORD
####################

.PHONY: op
op: ## Install 1password-cli
	./scripts/tools/1password/install.sh

####################
# GIT
####################

.PHONY: git-all
git-all: git hub git-flow git-stow ## Install & setup git

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

.PHONY: hub
hub: ## Install hub cli
	$(CURDIR)/scripts/tools/hub/install.sh

.PHONY: git-flow
git-flow: ## Install git-flow
	sudo apt install git-flow
	sudo curl -L -o /etc/bash_completion.d/git-flow-completion.bash \
		https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash

.PHONY: git-stow
git-stow: stow ## Symlink git files to $HOME
	stow git

####################
# TMUX
####################

.PHONY: tmux-all
tmux-all: tmux-build tmux-plugins tmux-stow ## Install & setup tmux

.PHONY: tmux-build
tmux-build: ## Build tmux from source (not tested yet)
	sudo apt update
	sudo apt install -y git make autoconf automake pkg-config libevent ncurses
	git clone https://github.com/tmux/tmux.git ${HOME}
	cd tmux && sh autogen.sh
	cd tmux && ./configure && make
	cd tmux && sudo make install

.PHONY: tmux-plugins
tmux-plugins: ## Install tmux plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo set -g @plugin 'tmux-plugins/tpm' >> ${HOME}/.tmux.conf
	echo set -g @plugin 'tmux-plugins/tmux-sensible' >> ${HOME}/.tmux.conf
	echo run -b '~/.tmux/plugins/tpm/tpm' >> ${HOME}/.tmux.conf

.PHONY: tmux-stow
tmux-stow: stow ## Stow tmux
	stow tmux

####################
# KUBERNETES
####################

.PHONY: kubectl
kubectl: ## Install kubectl
	./scripts/tools/kubernetes/kubectl.sh

.PHONY: docker
docker: ## Install docker
	curl -fsSL https://get.docker.com | sh

.PHONY: kind
kind: ## Install kind
	GO111MODULE="on" go get -u -v sigs.k8s.io/kind@v0.6.0

####################
# MACOS
####################

.PHONY: brew
brew: ## Install homebrew
ifeq ($(OSTYPE), "Darwin")
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif

####################
# NEOVIM
####################

.PHONY: neovim-all
neovim-all: neovim neovim-plug neovim-stow ## Install & setup neovim

.PHONY: neovim
neovim: ## Install neovim
	brew install neovim

.PHONY: neovim-plug
neovim-plug: ## Install vim-plug for neovim
	./scripts/tools/neovim/vim-plug.sh

.PHONY: neovim-stow
neovim-stow: stow ## Stow neovim
	stow neovim

####################
# VIM
####################

.PHONY: vim-all
vim-all: vim-build vim-stow ## Install & setup vim

.PHONY: vim-build
vim-build: ## Build vim from source
	sh $(CURDIR)/scripts/tools/vim/build.sh

.PHONY: vim-stow
vim-stow: stow ## Symlink vim files to $HOME
	stow vim

####################
# BASH
####################

.PHONY: bash-all
bash-all: bash bash-git-prompt bash-stow ## Install & setup bash

.PHONY: bash
bash: ## Install bash
	brew install bash

.PHONY: bash-git-prompt
bash-git-prompt: ## Install bash-git-prompt
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

.PHONY: bash-stow
bash-stow: bash-git-prompt ## Configures bash
	stow bash

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
