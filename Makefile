all: go rust node neovim

go:
	./scripts/langs/go/gimme.sh

rust:
	./scripts/langs/rust/install.sh

node:
	./scripts/langs/nvm/install.sh

neovim:
	./scripts/tools/neovim/install.sh

themes:
	mkdir -p $(CURDIR)/tmp/
	git clone https://github.com/mbadolato/iTerm2-Color-Schemes $(CURDIR)/tmp/themes

.PHONY: all neovim node rust go themes
