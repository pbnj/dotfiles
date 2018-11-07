#!/bin/bash

# Vim 8 introduced a native package manager
# Packages need to be under ~/.vim/pack/foo/start, where `foo` is any name you want it to be
# Packages under this path will be autoloaded

set -e
set -x

mkdir -p ~/.vim/pack/pb/start

cd ~/.vim/pack/pb/start

git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/cespare/vim-toml
git clone https://github.com/ekalinin/Dockerfile.vim
git clone https://github.com/elzr/vim-json
git clone https://github.com/ervandew/supertab
git clone https://github.com/fatih/vim-go
git clone https://github.com/godlygeek/tabular
git clone https://github.com/hashivim/vim-hashicorp-tools
git clone https://github.com/junegunn/fzf
git clone https://github.com/junegunn/fzf.vim
git clone https://github.com/mzlogin/vim-markdown-toc
git clone https://github.com/plasticboy/vim-markdown
git clone https://github.com/tpope/vim-apathy
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/tpope/vim-dadbod
git clone https://github.com/tpope/vim-dispatch
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-pathogen
git clone https://github.com/tpope/vim-sensible
git clone https://github.com/tpope/vim-sleuth
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-vinegar.git
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-syntastic/syntastic
git clone https://github.com/w0rp/ale
