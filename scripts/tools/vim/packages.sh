#!/bin/bash

set -x

# Vim 8 introduced a native package manager
# Packages need to be under ~/.vim/pack/foo/start, where `foo` is any name you want it to be
# Packages under this path will be autoloaded
# For more info: https://shapeshed.com/vim-packages/

mkdir -p $HOME/.vim/pack/pb/start

git submodule add https://github.com/airblade/vim-gitgutter 	  $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-gitgutter
git submodule add https://github.com/cespare/vim-toml       	  $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-toml
git submodule add https://github.com/ekalinin/Dockerfile.vim      $HOME/.dotfiles/vim/.vim/pack/pb/start/Dockerfile.vim
git submodule add https://github.com/elzr/vim-json                $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-json
git submodule add https://github.com/ervandew/supertab            $HOME/.dotfiles/vim/.vim/pack/pb/start/supertab
git submodule add https://github.com/fatih/vim-go                 $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-go
git submodule add https://github.com/godlygeek/tabular            $HOME/.dotfiles/vim/.vim/pack/pb/start/tabular
git submodule add https://github.com/hashivim/vim-hashicorp-tools $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-hashicorp-tools
git submodule add https://github.com/mzlogin/vim-markdown-toc     $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-markdown-toc
git submodule add https://github.com/plasticboy/vim-markdown      $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-markdown
git submodule add https://github.com/tpope/vim-apathy             $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-apathy
git submodule add https://github.com/tpope/vim-commentary         $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-commentary
git submodule add https://github.com/tpope/vim-dadbod             $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-dadbod
git submodule add https://github.com/tpope/vim-dispatch           $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-dispatch
git submodule add https://github.com/tpope/vim-fugitive           $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-fugitive
git submodule add https://github.com/tpope/vim-sensible           $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-sensible
git submodule add https://github.com/tpope/vim-sleuth             $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-sleuth
git submodule add https://github.com/tpope/vim-surround           $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-surround
git submodule add https://github.com/tpope/vim-vinegar            $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-vinegar
git submodule add https://github.com/vim-airline/vim-airline      $HOME/.dotfiles/vim/.vim/pack/pb/start/vim-airline

# updating packages
# git submodule update --remote --merge
# git commit

# removing packages
# git submodule deinit vim/pack/shapeshed/start/vim-airline
# git rm vim/pack/shapeshed/start/vim-airline
# rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
# git commit
