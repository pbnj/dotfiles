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
	curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
	chmod +x ~/bin/gimme

.PHONY: go
go: ## Install go
	sh $(CURDIR)/scripts/langs/go/install.sh

.PHONY: go-pkgs
go-pkgs: ## Install Go packages
	go get -u -v golang.org/x/tools/cmd/gopls
	GO111MODULE=on go get -u -v sigs.k8s.io/kind@master

.PHONY: nvm
nvm: ## Install Node Version Manager and Node
ifeq (, $(shell which nvm))
	sh $(CURDIR)/scripts/langs/nvm/install.sh
endif

.PHONY: npm
npm: ## Install npm packages
	npm install -g prettier doctoc bash-language-server dockerfile-language-server-nodejs
