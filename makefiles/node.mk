# vi: set ft=make :

################################################################################
# NODEJS
################################################################################

.PHONY: node
node: ## Install node.js
	./scripts/langs/nvm/install.sh

