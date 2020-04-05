.PHONY: go
go:
	./scripts/langs/go/gimme.sh

.PHONY: rust
rust:
	./scripts/langs/rust/install.sh

.PHONY: node
node:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

.PHONY: neovim
neovim:
	curl -L -o ~/bin/nvim https://github.com/neovim/neovim/releases/download/stable/nvim.appimage --create-dirs
	chmod u+x ~/bin/nvim
