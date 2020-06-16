.DEFAULT_GOAL := help

.PHONY: help
help: ## Print help
	@grep -oh -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s	%s\n", $$1, $$2}'

.PHONY: all
all: go rust node neovim ## Run all tasks

.PHONY: go
go: ## Install go
	./scripts/langs/go/gimme.sh

.PHONY: rust
rust: ## Install rust
	./scripts/langs/rust/install.sh

.PHONY: node
node: ## Install node.js
	./scripts/langs/nvm/install.sh

.PHONY: neovim
neovim: ## Install neovim
	./scripts/tools/neovim/install.sh

