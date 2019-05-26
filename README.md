# Dotfiles

## Getting Started

This repository contains git submodules (e.g. vim packages).

When cloning this repo, make sure to run:

    git clone --recurse-submodules -j8 petermbenjamin/dotfiles $HOME/.dotfiles

Alternatively, if the repo was cloned without `--recurse-submodule`, then run:

    git submodule update --init --recursive

This will checkout the submodules as well.

Lastly, checkout the [`Makefile`](Makefile) or run:

    make

This will print out all available `make` targets.

## Disclaimer

Use at your own risk!
