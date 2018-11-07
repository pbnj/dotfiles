#!/bin/bash

# Vim 8 introduced a native package manager
# Packages need to be under ~/.vim/pack/foo/start, where `foo` is any name you want it to be
# Packages under this path will be autoloaded

set -e
set -x

git submodule add https://github.com/airblade/vim-gitgutter       ~/.dotfiles/vim/.vim/pack/pb/start/vim-gitgutter
git submodule add https://github.com/cespare/vim-toml             ~/.dotfiles/vim/.vim/pack/pb/start/vim-toml
git submodule add https://github.com/ekalinin/Dockerfile.vim      ~/.dotfiles/vim/.vim/pack/pb/start/Dockerfile.vim
git submodule add https://github.com/elzr/vim-json                ~/.dotfiles/vim/.vim/pack/pb/start/vim-json
git submodule add https://github.com/ervandew/supertab            ~/.dotfiles/vim/.vim/pack/pb/start/supertab
git submodule add https://github.com/fatih/vim-go                 ~/.dotfiles/vim/.vim/pack/pb/start/vim-go
git submodule add https://github.com/godlygeek/tabular            ~/.dotfiles/vim/.vim/pack/pb/start/tabular
git submodule add https://github.com/hashivim/vim-hashicorp-tools ~/.dotfiles/vim/.vim/pack/pb/start/vim-hashicorp-tools
git submodule add https://github.com/junegunn/fzf                 ~/.dotfiles/vim/.vim/pack/pb/start/fzf
git submodule add https://github.com/junegunn/fzf.vim             ~/.dotfiles/vim/.vim/pack/pb/start/fzf.vim
git submodule add https://github.com/mzlogin/vim-markdown-toc     ~/.dotfiles/vim/.vim/pack/pb/start/vim-markdown-toc
git submodule add https://github.com/plasticboy/vim-markdown      ~/.dotfiles/vim/.vim/pack/pb/start/vim-markdown
git submodule add https://github.com/tpope/vim-apathy             ~/.dotfiles/vim/.vim/pack/pb/start/vim-apathy
git submodule add https://github.com/tpope/vim-commentary         ~/.dotfiles/vim/.vim/pack/pb/start/vim-commentary
git submodule add https://github.com/tpope/vim-dadbod             ~/.dotfiles/vim/.vim/pack/pb/start/vim-dadbod
git submodule add https://github.com/tpope/vim-dispatch           ~/.dotfiles/vim/.vim/pack/pb/start/vim-dispatch
git submodule add https://github.com/tpope/vim-fugitive           ~/.dotfiles/vim/.vim/pack/pb/start/vim-fugitive
git submodule add https://github.com/tpope/vim-sensible           ~/.dotfiles/vim/.vim/pack/pb/start/vim-sensible
git submodule add https://github.com/tpope/vim-sleuth             ~/.dotfiles/vim/.vim/pack/pb/start/vim-sleuth
git submodule add https://github.com/tpope/vim-surround           ~/.dotfiles/vim/.vim/pack/pb/start/vim-surround
git submodule add https://github.com/tpope/vim-vinegar            ~/.dotfiles/vim/.vim/pack/pb/start/vim-vinegar
git submodule add https://github.com/vim-airline/vim-airline      ~/.dotfiles/vim/.vim/pack/pb/start/vim-airline
git submodule add https://github.com/vim-syntastic/syntastic      ~/.dotfiles/vim/.vim/pack/pb/start/syntastic
git submodule add https://github.com/w0rp/ale                     ~/.dotfiles/vim/.vim/pack/pb/start/ale
