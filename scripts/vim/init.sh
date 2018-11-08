#!/bin/bash

# Vim 8 introduced a native package manager
# Packages need to be under ~/.vim/pack/foo/start, where `foo` is any name you want it to be
# Packages under this path will be autoloaded

set -e
set -x

git clone https://github.com/airblade/vim-gitgutter       ~/.dotfiles/vim/.vim/pack/bundles/start/vim-gitgutter
git clone https://github.com/cespare/vim-toml             ~/.dotfiles/vim/.vim/pack/bundles/start/vim-toml
git clone https://github.com/ekalinin/Dockerfile.vim      ~/.dotfiles/vim/.vim/pack/bundles/start/Dockerfile.vim
git clone https://github.com/elzr/vim-json                ~/.dotfiles/vim/.vim/pack/bundles/start/vim-json
git clone https://github.com/ervandew/supertab            ~/.dotfiles/vim/.vim/pack/bundles/start/supertab
git clone https://github.com/fatih/vim-go                 ~/.dotfiles/vim/.vim/pack/bundles/start/vim-go
git clone https://github.com/godlygeek/tabular            ~/.dotfiles/vim/.vim/pack/bundles/start/tabular
git clone https://github.com/hashivim/vim-hashicorp-tools ~/.dotfiles/vim/.vim/pack/bundles/start/vim-hashicorp-tools
git clone https://github.com/junegunn/fzf                 ~/.dotfiles/vim/.vim/pack/bundles/start/fzf
git clone https://github.com/junegunn/fzf.vim             ~/.dotfiles/vim/.vim/pack/bundles/start/fzf.vim
git clone https://github.com/mattn/emmet-vim              ~/.dotfiles/vim/.vim/pack/bundles/start/emmet-vim
git clone https://github.com/mzlogin/vim-markdown-toc     ~/.dotfiles/vim/.vim/pack/bundles/start/vim-markdown-toc
git clone https://github.com/plasticboy/vim-markdown      ~/.dotfiles/vim/.vim/pack/bundles/start/vim-markdown
git clone https://github.com/tpope/vim-apathy             ~/.dotfiles/vim/.vim/pack/bundles/start/vim-apathy
git clone https://github.com/tpope/vim-commentary         ~/.dotfiles/vim/.vim/pack/bundles/start/vim-commentary
git clone https://github.com/tpope/vim-dispatch           ~/.dotfiles/vim/.vim/pack/bundles/start/vim-dispatch
git clone https://github.com/tpope/vim-fugitive           ~/.dotfiles/vim/.vim/pack/bundles/start/vim-fugitive
git clone https://github.com/tpope/vim-sensible           ~/.dotfiles/vim/.vim/pack/bundles/start/vim-sensible
git clone https://github.com/tpope/vim-sleuth             ~/.dotfiles/vim/.vim/pack/bundles/start/vim-sleuth
git clone https://github.com/tpope/vim-surround           ~/.dotfiles/vim/.vim/pack/bundles/start/vim-surround
git clone https://github.com/tpope/vim-vinegar            ~/.dotfiles/vim/.vim/pack/bundles/start/vim-vinegar
git clone https://github.com/vim-airline/vim-airline      ~/.dotfiles/vim/.vim/pack/bundles/start/vim-airline
git clone https://github.com/vim-syntastic/syntastic      ~/.dotfiles/vim/.vim/pack/bundles/start/syntastic
git clone https://github.com/w0rp/ale                     ~/.dotfiles/vim/.vim/pack/bundles/start/ale
