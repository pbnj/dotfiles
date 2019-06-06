.DEFAULT_GOAL:=help

include tools.mk
include langs.mk

.PHONY: help
help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: all
all: stow bash tmux git vim go nvm

PHONY: ssh-tunnel
SSH_TARGET:=""
ssh-tunnel: ## Create SSH tunnels
	/usr/bin/ssh \
		-i ~/.ssh/td_rsa \
		-o "ServerAliveInterval 30" \
		-o "ServerAliveCountMax 3" \
		-o "ExitOnForwardFailure=yes" \
		-R 2222:localhost:22 $(SSH_TARGET)
