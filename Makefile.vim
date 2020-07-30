# vim: set ft=make :

################################################################################
# VIM
################################################################################

.PHONY: vim-plug
vim-plug: ## Install vim-plug
	./scripts/tools/neovim/vim-plug.sh

.PHONY: vim-plugs
vim-plugs: ## Install vim plugins
	source $(HOME)/.nvm/nvm.sh \
		&& nvim --headless +PlugInstall +qall \
		&& nvim --headless +CocUpdateSync +qall

