.PHONY: rust
rust: ## Install rust
	./scripts/langs/rust/install.sh

.PHONY: crate-deps
crate-deps: apt-update ## Install crate dependencies
	apt-get install -y \
		build-essential \
		clang \
		libclang-dev \
		libssl-dev \
		llvm \
		pkg-config

.PHONY: crates
crates: cargo-exa cargo-ripgrep cargo-bat cargo-starship ## Install rust crates

.PHONY: cargo-exa
cargo-exa: ## cargo install exa
	source "$(HOME)/.cargo/env" \
		&& cargo install exa

.PHONY: cargo-ripgrep
cargo-ripgrep: ## cargo install ripgrep
	source "$(HOME)/.cargo/env" \
		&& cargo install ripgrep

.PHONY: cargo-bat
cargo-bat: ## cargo install bat
	source "$(HOME)/.cargo/env" \
		&& cargo install bat

.PHONY: cargo-starship
cargo-starship: ## cargo install starship
	source "$(HOME)/.cargo/env" \
		&& cargo install starship
