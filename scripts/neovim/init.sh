#!/bin/bash

set -e
set -x

mkdir -p ~/.dotfiles/neovim/.config/nvim/pack/bundles/start/

git submodule add https://github.com/airblade/vim-gitgutter       neovim/.config/nvim/pack/bundles/start/vim-gitgutter
git submodule add https://github.com/cespare/vim-toml             neovim/.config/nvim/pack/bundles/start/vim-toml
git submodule add https://github.com/ekalinin/Dockerfile.vim      neovim/.config/nvim/pack/bundles/start/Dockerfile.vim
git submodule add https://github.com/elzr/vim-json                neovim/.config/nvim/pack/bundles/start/vim-json
git submodule add https://github.com/ervandew/supertab            neovim/.config/nvim/pack/bundles/start/supertab
git submodule add https://github.com/fatih/vim-go                 neovim/.config/nvim/pack/bundles/start/vim-go
git submodule add https://github.com/godlygeek/tabular            neovim/.config/nvim/pack/bundles/start/tabular
git submodule add https://github.com/hashivim/vim-hashicorp-tools neovim/.config/nvim/pack/bundles/start/vim-hashicorp-tools
git submodule add https://github.com/junegunn/fzf                 neovim/.config/nvim/pack/bundles/start/fzf
git submodule add https://github.com/junegunn/fzf.vim             neovim/.config/nvim/pack/bundles/start/fzf.vim
git submodule add https://github.com/mattn/emmet-vim              neovim/.config/nvim/pack/bundles/start/emmet-vim
git submodule add https://github.com/mzlogin/vim-markdown-toc     neovim/.config/nvim/pack/bundles/start/vim-markdown-toc
git submodule add https://github.com/plasticboy/vim-markdown      neovim/.config/nvim/pack/bundles/start/vim-markdown
git submodule add https://github.com/tpope/vim-apathy             neovim/.config/nvim/pack/bundles/start/vim-apathy
git submodule add https://github.com/tpope/vim-commentary         neovim/.config/nvim/pack/bundles/start/vim-commentary
git submodule add https://github.com/tpope/vim-dadbod             neovim/.config/nvim/pack/bundles/start/vim-dadbod
git submodule add https://github.com/tpope/vim-dispatch           neovim/.config/nvim/pack/bundles/start/vim-dispatch
git submodule add https://github.com/tpope/vim-fugitive           neovim/.config/nvim/pack/bundles/start/vim-fugitive
git submodule add https://github.com/tpope/vim-sensible           neovim/.config/nvim/pack/bundles/start/vim-sensible
git submodule add https://github.com/tpope/vim-sleuth             neovim/.config/nvim/pack/bundles/start/vim-sleuth
git submodule add https://github.com/tpope/vim-surround           neovim/.config/nvim/pack/bundles/start/vim-surround
git submodule add https://github.com/tpope/vim-vinegar            neovim/.config/nvim/pack/bundles/start/vim-vinegar
git submodule add https://github.com/vim-airline/vim-airline      neovim/.config/nvim/pack/bundles/start/vim-airline
git submodule add https://github.com/vim-syntastic/syntastic      neovim/.config/nvim/pack/bundles/start/syntastic
git submodule add https://github.com/w0rp/ale                     neovim/.config/nvim/pack/bundles/start/ale
