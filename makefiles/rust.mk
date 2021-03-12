################################################################################
# RUST
################################################################################

## Install rust
.PHONY: rust
rust:
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	source $(HOME)/.cargo/env

## Install crate dependencies
.PHONY: rust-crate-deps
rust-crate-deps:
	apt-get update
	apt-get install -y \
		build-essential \
		clang \
		libclang-dev \
		libssl-dev \
		llvm \
		pkg-config

## Install rust crates
.PHONY: rust-cargo-crates
rust-cargo-crates: rust-cargo-exa rust-cargo-ripgrep rust-cargo-starship

## cargo install exa
.PHONY: rust-cargo-exa
rust-cargo-exa:
	source "$(HOME)"/.cargo/env && cargo install exa

## cargo install ripgrep
.PHONY: rust-cargo-ripgrep
rust-cargo-ripgrep:
	source "$(HOME)"/.cargo/env && cargo install ripgrep

## cargo install starship
.PHONY: rust-cargo-starship
rust-cargo-starship:
	source "$(HOME)"/.cargo/env && cargo install starship

# vim: ft=make
