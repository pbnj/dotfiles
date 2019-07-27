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

.PHONY: hub
hub: ## Install hub cli
ifeq ($(OSTYPE), "Darwin")
	brew install hub
else
	HUB_PATH := "$(GOPATH)"/src/github.com/github
	@$(RM) "$(HUB_PATH)"
	mkdir -p "$(HUB_PATH)"
	git clone \
		--config transfer.fsckobjects=false \
		--config receive.fsckobjects=false \
		--config fetch.fsckobjects=false \
		https://github.com/github/hub.git "$(HUB_PATH)"
	$(MAKE) -C "$(HUB_PATH)" install prefix=/usr/local
	curl -Lo ~/.oh-my-zsh/custom/plugins/hub/_hub \
		--create-dirs \
		https://github.com/github/hub/raw/master/etc/hub.zsh_completion
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
# TMUX
####################

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
	GO111MODULE="on" go get -u -v sigs.k8s.io/kind@v0.4.0

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

.PHONY: vim-colors
vim-colors: ## Install vim colors
	curl -Lo ~/.vim/colors/monotone.vim \
		--create-dirs \
		https://github.com/Lokaltog/vim-monotone/raw/master/colors/monotone.vim

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: vim-build
vim-build: ## Build vim from source
	sh $(CURDIR)/scripts/tools/vim/build.sh

.PHONY: vim-packs
vim-packs: ## Install vim packages
	git submodule update --init --recursive

.PHONY: vim-packs-update
vim-packs-update: ## Updates vim packages
	git submodule update --remote --merge

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
# BASH
####################
.PHONY: bash-git-prompt
bash-git-prompt: ## Install bash-git-prompt
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

####################
# ZSH
####################

.PHONY: zsh
zsh: oh-my-zsh zsh-plugins zsh-pure-prompt ## Install zsh

.PHONY: oh-my-zsh
oh-my-zsh: ## Install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

.PHONY: zsh-plugins
zsh-plugins: ## Install zsh plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-completions $(HOME)/.oh-my-zsh/custom/plugins/zsh-completions

.PHONY: zsh-pure-prompt
zsh-pure-prompt: ## Install Pure prompt
	git clone https://github.com/sindresorhus/pure $(HOME)/.oh-my-zsh/custom/pure
	sudo ln -s "$(HOME)/.oh-my-zsh/custom/pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
	sudo ln -s "$(HOME)/.oh-my-zsh/custom/pure/async.zsh" /usr/local/share/zsh/site-functions/async

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

.PHONY: stow-all
stow-all: stow stow-bash stow-git stow-tmux stow-vim stow-neovim ## Stow all files

.PHONY: stow-bash
stow-bash: bash-git-prompt ## Configures bash
	stow bash

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
