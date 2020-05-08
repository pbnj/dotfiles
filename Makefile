all: go rust node neovim asdf

asdf:
	./scripts/tools/asdf/install.sh

go:
	./scripts/langs/go/gimme.sh

rust:
	./scripts/langs/rust/install.sh

node:
	./scripts/langs/nvm/install.sh

neovim:
	./scripts/tools/neovim/install.sh

.PHONY: all neovim node rust go asdf
