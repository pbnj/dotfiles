# Install rust toolchain
rust:
	./scripts/langs/rust/install.sh

# Install additional rust tools
rust-tools: rust
	./scripts/langs/rust/tools.sh

# Install crates
crates:
	./scripts/langs/rust/crates.sh

# Install gimme (Go version manager)
gimme:
	./scripts/langs/go/gimme.sh

# Install go
go:
	./scripts/langs/go/install.sh

# Install Go packages
go-pkgs:
	./scripts/langs/go/install-pkgs.sh

# Install Node Version Manager and Node
nvm:
	./scripts/langs/nvm/install.sh

# Install npm packages
npm:
	./scripts/langs/nvm/install-pkgs.sh

# Install ZSH, Oh-My-ZSH, & Plugins
zsh-all: zsh oh-my-zsh zsh-plugins

# Install ZSH, OHMYZSH, & Plugins
zsh:
	./scripts/shell/zsh/zsh.sh

# Install Oh-My-ZSH
oh-my-zsh:
	./scripts/shell/zsh/ohmyzsh.sh

# Install zsh plugins
zsh-plugins:
	./scripts/shell/zsh/plugins.sh

# Install 1password-cli
op:
	./scripts/tools/1password/install.sh

# Install & setup git
git-all: git hub git-flow stow-git

# Install git
git:
	#!/bin/bash
	if [ "$(uname)" == "Darwin" ]; then
		brew install git
	else
		sudo apt-get install software-properties-common
		sudo add-apt-repository ppa:git-core/ppa
		sudo apt-get update
		sudo apt-get install git
	fi

# Install hub cli
hub:
	./scripts/tools/hub/install.sh

# Install git-flow
git-flow:
	sudo apt install git-flow
	sudo curl -L -o /etc/bash_completion.d/git-flow-completion.bash \
		https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash

# Symlink git files to $HOME
stow-git: stow
	stow git

# Install & setup tmux
tmux-all: tmux-build tmux-plugins stow-tmux

# Build tmux from source (not tested yet)
tmux-build:
	sudo apt update
	sudo apt install -y git make autoconf automake pkg-config libevent ncurses
	git clone https://github.com/tmux/tmux.git ${HOME}
	cd tmux && sh autogen.sh
	cd tmux && ./configure && make
	cd tmux && sudo make install

# Install tmux plugins
tmux-plugins:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo set -g @plugin 'tmux-plugins/tpm' >> ${HOME}/.tmux.conf
	echo set -g @plugin 'tmux-plugins/tmux-sensible' >> ${HOME}/.tmux.conf
	echo run -b '~/.tmux/plugins/tpm/tpm' >> ${HOME}/.tmux.conf

# Stow tmux
stow-tmux: stow
	stow tmux

# Install kubectl
kubectl:
	./scripts/tools/kubernetes/kubectl.sh

# Install docker
docker:
	curl -fsSL https://get.docker.com | sh

# Install kind
kind:
	GO111MODULE="on" go get -u -v sigs.k8s.io/kind@v0.7.0

# Install homebrew
brew:
	#!/bin/bash
	if [ "$(uname)" == "Darwin" ]; then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

# Install & setup neovim
neovim-all: neovim neovim-plug stow-neovim

# Install neovim
neovim:
	brew install neovim

# Install vim-plug for neovim
neovim-plug:
	./scripts/tools/neovim/vim-plug.sh

# Stow neovim
stow-neovim: stow
	stow neovim

# Install & setup vim
vim-all: vim-build stow-vim

# Build vim from source
vim-build:
	./scripts/tools/vim/build.sh

# Symlink vim files to $HOME
stow-vim: stow
	stow vim

# Install & setup bash
bash-all: bash bash-git-prompt stow-bash

# Install bash
bash:
	brew install bash

# Install bash-git-prompt
bash-git-prompt:
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Configures bash
stow-bash: bash-git-prompt
	stow bash

# Install stow
stow:
	#!/bin/bash
	if [ "$(uname)" == "Darwin" ]; then
		brew install stow
	else
		sudo apt-get update
		sudo apt-get install -y stow
	fi

# Symlink alacritty config
stow-alacritty:
	stow alacritty

# Symlink starship config
stow-starship:
	stow starship

# Symlink all
stow-all: stow-bash stow-git stow-neovim stow-tmux stow-alacritty stow-starship
