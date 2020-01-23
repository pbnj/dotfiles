.PHONY: rust
rust: ## Install rust toolchain
	./scripts/langs/rust/install.sh

.PHONY: rust-tools
rust-tools: rust ## Install additional rust tools
	./scripts/langs/rust/tools.sh

.PHONY: crates
crates: ## Install crates
	./scripts/langs/rust/crates.sh

.PHONY: gimme
gimme: ## Install gimme (Go version manager)
	./scripts/langs/go/gimme.sh

.PHONY: go
go: ## Install go
	./scripts/langs/go/install.sh

.PHONY: go-pkgs
go-pkgs: ## Install Go packages
	./scripts/langs/go/install-pkgs.sh

.PHONY: nvm
nvm: ## Install Node Version Manager and Node
	./scripts/langs/nvm/install.sh

.PHONY: npm
npm: ## Install npm packages
	./scripts/langs/nvm/install-pkgs.sh
