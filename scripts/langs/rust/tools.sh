#!/bin/bash

set -e
set -x

rustup component add rust-analysis rust-src
rustup component add clippy rustfmt rust-docs
