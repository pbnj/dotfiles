.PHONY: rust
rust: ## Install rust toolchain
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	rustup component add rls rust-analysis rust-src
	rustup component add clippy rustfmt rust-docs
	rustup toolchain add nightly
	rustup completions bash > /usr/local/etc/bash_completion.d/rustup
	rustup completions bash cargo > /usr/local/etc/bash_completion.d/cargo

.PHONY: crates
crates: ## Install crates
	cargo +nightly install rust-racer
	cargo install exa bat ripgrep

.PHONY: gimme
gimme: ## Install gimme (Go version manager)
	sudo curl -sL -o /usr/local/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
	sudo chmod +x /usr/local/bin/gimme

.PHONY: go
GO_VERSION := $(shell curl -fsSL https://golang.org/VERSION?m=text)
GO_ARCH := linux-amd64
#https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
go: ## Install go
	curl -fsSL https://dl.google.com/go/$(GO_VERSION).$(GO_ARCH).tar.gz | sudo tar -vxzC /usr/local -f -

.PHONY: go-pkgs
go-pkgs: ## Install Go packages
	go get -u -v golang.org/x/tools/cmd/gopls
	GO111MODULE=on go get -u -v sigs.k8s.io/kind@master

.PHONY: nvm
nvm: ## Install Node Version Manager and Node
ifeq (, $(shell which nvm))
	sh $(CURDIR)/scripts/langs/nvm/install.sh
endif
	nvm install --lts

.PHONY: npm
npm: ## Install npm packages
	npm install -g prettier
