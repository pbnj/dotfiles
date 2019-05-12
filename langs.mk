.PHONY: rust
rust: ## Install rust toolchain
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	sh scripts/langs/rust/toolchain.sh
	sh scripts/langs/rust/cargo.sh
	rustup completions bash > /usr/local/etc/bash_completion.d/rustup
	rustup completions bash cargo > /usr/local/etc/bash_completion.d/cargo

.PHONY: go
GO_VERSION := $(shell curl -fsSL https://golang.org/VERSION?m=text)
GO_ARCH := linux-amd64
#https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
go: ## Install go
	curl -fsSL https://dl.google.com/go/$(GO_VERSION).$(GO_ARCH).tar.gz | sudo tar -vxzC /usr/local -f -

.PHONY: nvm
nvm: ## Install Node Version Manager and Node
ifeq (, $(shell which nvm))
	sh $(CURDIR)/scripts/langs/nvm/install.sh
endif
