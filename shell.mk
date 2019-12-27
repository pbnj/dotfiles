.PHONY: zsh-all
zsh-all: zsh oh-my-zsh zsh-plugins ## Install ZSH, Oh-My-ZSH, & Plugins

.PHONY: zsh
zsh: ## Install ZSH, OHMYZSH, & Plugins
	./scripts/shell/zsh/zsh.sh

.PHONY: oh-my-zsh
oh-my-zsh: ## Install Oh-My-ZSH
	./scripts/shell/zsh/ohmyzsh.sh

.PHONY: zsh-plugins
zsh-plugins: ## Install zsh plugins
	./scripts/shell/zsh/plugins.sh

