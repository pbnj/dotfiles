.PHONY: all
all: neovim vim tmux git battstat

.PHONY: neovim
neovim: vim-plug
    ln -sf $(CURDIR)/neovim/init.vim $(HOME)/.config/nvim/init.vim

.PHONY: vim
vim: vim-plug
    ln -sf $(CURDIR)/neovim/init.vim $(HOME)/.vimrc

.PHONY: vim-plug
vim-plug: ## Install vim-plug
    sh $(CURDIR)/vim/vim-plug.sh

.PHONY: tmux
tmux: ## Install tmux & config
    sh $(CURDIR)/tmux/build.sh
    ln -sf $(CURDIR)/tmux/.tmux.conf $(HOME)/.tmux.conf

.PHONY: git
git: ## Configures git
    curl -o $(HOME)/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
    ln -sf $(CURDIR)/git/.gitconfig $(HOME)/.gitconfig

.PHONY: battstat
battstat: ## Installs battstat cli
    git clone https://github.com/imwally/battstat $(HOME)/battstat
    chmod u+x $(HOME)/battstat/battstat
    mv $(HOME)/battstat/battstat /usr/local/bin/
