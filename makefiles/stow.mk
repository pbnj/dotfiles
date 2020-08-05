# vi: set ft=make :

################################################################################
# STOW
################################################################################
.PHONY: stow
stow: stow-git stow-tmux stow-bash stow-vim ## Symlink files

.PHONY: stow-git
stow-git: ## Stow git
	stow git

.PHONY: stow-tmux
stow-tmux: ## Stow tmux
	stow tmux

.PHONY: stow-bash
stow-bash: ## Stow bash
	stow bash

.PHONY: stow-vim
stow-vim: ## Stow git
	stow vim

.PHONY: stow-starship
stow-starship: ## Stow starship
	stow starship
