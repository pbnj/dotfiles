#!/bin/bash

# https://github.com/racer-rust/racer
rustup toolchain add nightly
cargo +nightly install racer

# https://github.com/rust-lang/rls
rustup component add rls rust-analysis rust-src

rustup component add clippy rustfmt rust-docs
