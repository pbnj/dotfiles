################################################################################
# DEPENDENCIES
################################################################################

.PHONY: apt-update
apt-update: ## Run apt-get update
	apt-get update

.PHONY: install-deps
install-deps: apt-update ## Install dependencies. Must run manually first.
	apt-get install -y \
		ca-certificates \
		curl \
		git \
		stow \
		tmux \
		vim

