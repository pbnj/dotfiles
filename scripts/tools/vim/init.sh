#!/bin/bash

# Vim 8 introduced a native package manager
# Packages need to be under ~/.vim/pack/foo/start, where `foo` is any name you want it to be
# Packages under this path will be autoloaded

set -e
set -x

[ -d "$HOME/.vim/" ] && rm -rf "$HOME/.vim"
mkdir -p "$HOME/.vim/pack/bundles/start"

git clone https://github.com/airblade/vim-gitgutter       $HOME/.vim/pack/bundles/start/vim-gitgutter
git clone https://github.com/cespare/vim-toml             $HOME/.vim/pack/bundles/start/vim-toml
git clone https://github.com/ekalinin/Dockerfile.vim      $HOME/.vim/pack/bundles/start/Dockerfile.vim
git clone https://github.com/elzr/vim-json                $HOME/.vim/pack/bundles/start/vim-json
git clone https://github.com/ervandew/supertab            $HOME/.vim/pack/bundles/start/supertab
git clone https://github.com/fatih/vim-go                 $HOME/.vim/pack/bundles/start/vim-go
git clone https://github.com/godlygeek/tabular            $HOME/.vim/pack/bundles/start/tabular
git clone https://github.com/hashivim/vim-hashicorp-tools $HOME/.vim/pack/bundles/start/vim-hashicorp-tools
git clone https://github.com/junegunn/fzf                 $HOME/.vim/pack/bundles/start/fzf
git clone https://github.com/junegunn/fzf.vim             $HOME/.vim/pack/bundles/start/fzf.vim
git clone https://github.com/mattn/emmet-vim              $HOME/.vim/pack/bundles/start/emmet-vim
git clone https://github.com/mzlogin/vim-markdown-toc     $HOME/.vim/pack/bundles/start/vim-markdown-toc
git clone https://github.com/plasticboy/vim-markdown      $HOME/.vim/pack/bundles/start/vim-markdown
git clone https://github.com/tpope/vim-apathy             $HOME/.vim/pack/bundles/start/vim-apathy
git clone https://github.com/tpope/vim-commentary         $HOME/.vim/pack/bundles/start/vim-commentary
git clone https://github.com/tpope/vim-dispatch           $HOME/.vim/pack/bundles/start/vim-dispatch
git clone https://github.com/tpope/vim-fugitive           $HOME/.vim/pack/bundles/start/vim-fugitive
git clone https://github.com/tpope/vim-sensible           $HOME/.vim/pack/bundles/start/vim-sensible
git clone https://github.com/tpope/vim-sleuth             $HOME/.vim/pack/bundles/start/vim-sleuth
git clone https://github.com/tpope/vim-surround           $HOME/.vim/pack/bundles/start/vim-surround
git clone https://github.com/tpope/vim-vinegar            $HOME/.vim/pack/bundles/start/vim-vinegar
git clone https://github.com/vim-airline/vim-airline      $HOME/.vim/pack/bundles/start/vim-airline
git clone https://github.com/w0rp/ale                     $HOME/.vim/pack/bundles/start/ale
