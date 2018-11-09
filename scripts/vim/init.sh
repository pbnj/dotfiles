#!/bin/bash

# Vim 8 introduced a native package manager
# Packages need to be under ~/.vim/pack/foo/start, where `foo` is any name you want it to be
# Packages under this path will be autoloaded

set -e
set -x

git submodule add https://github.com/airblade/vim-gitgutter       vim/.vim/pack/bundles/start/vim-gitgutter
git submodule add https://github.com/cespare/vim-toml             vim/.vim/pack/bundles/start/vim-toml
git submodule add https://github.com/ekalinin/Dockerfile.vim      vim/.vim/pack/bundles/start/Dockerfile.vim
git submodule add https://github.com/elzr/vim-json                vim/.vim/pack/bundles/start/vim-json
git submodule add https://github.com/ervandew/supertab            vim/.vim/pack/bundles/start/supertab
git submodule add https://github.com/fatih/vim-go                 vim/.vim/pack/bundles/start/vim-go
git submodule add https://github.com/godlygeek/tabular            vim/.vim/pack/bundles/start/tabular
git submodule add https://github.com/hashivim/vim-hashicorp-tools vim/.vim/pack/bundles/start/vim-hashicorp-tools
git submodule add https://github.com/junegunn/fzf                 vim/.vim/pack/bundles/start/fzf
git submodule add https://github.com/junegunn/fzf.vim             vim/.vim/pack/bundles/start/fzf.vim
git submodule add https://github.com/mattn/emmet-vim              vim/.vim/pack/bundles/start/emmet-vim
git submodule add https://github.com/mzlogin/vim-markdown-toc     vim/.vim/pack/bundles/start/vim-markdown-toc
git submodule add https://github.com/plasticboy/vim-markdown      vim/.vim/pack/bundles/start/vim-markdown
git submodule add https://github.com/tpope/vim-apathy             vim/.vim/pack/bundles/start/vim-apathy
git submodule add https://github.com/tpope/vim-commentary         vim/.vim/pack/bundles/start/vim-commentary
git submodule add https://github.com/tpope/vim-dadbod             vim/.vim/pack/bundles/start/vim-dadbod
git submodule add https://github.com/tpope/vim-dispatch           vim/.vim/pack/bundles/start/vim-dispatch
git submodule add https://github.com/tpope/vim-fugitive           vim/.vim/pack/bundles/start/vim-fugitive
git submodule add https://github.com/tpope/vim-sensible           vim/.vim/pack/bundles/start/vim-sensible
git submodule add https://github.com/tpope/vim-sleuth             vim/.vim/pack/bundles/start/vim-sleuth
git submodule add https://github.com/tpope/vim-surround           vim/.vim/pack/bundles/start/vim-surround
git submodule add https://github.com/tpope/vim-vinegar            vim/.vim/pack/bundles/start/vim-vinegar
git submodule add https://github.com/vim-airline/vim-airline      vim/.vim/pack/bundles/start/vim-airline
git submodule add https://github.com/vim-syntastic/syntastic      vim/.vim/pack/bundles/start/syntastic
git submodule add https://github.com/w0rp/ale                     vim/.vim/pack/bundles/start/ale
