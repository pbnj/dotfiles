#!/bin/bash

set -e
set -x

mkdir -p ~/.dotfiles/neovim/.config/nvim/pack/pb/start/

git clone https://github.com/airblade/vim-gitgutter       ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-gitgutter
git clone https://github.com/cespare/vim-toml             ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-toml
git clone https://github.com/ekalinin/Dockerfile.vim      ~/.dotfiles/neovim/.config/nvim/pack/pb/start/Dockerfile.vim
git clone https://github.com/elzr/vim-json                ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-json
git clone https://github.com/ervandew/supertab            ~/.dotfiles/neovim/.config/nvim/pack/pb/start/supertab
git clone https://github.com/fatih/vim-go                 ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-go
git clone https://github.com/godlygeek/tabular            ~/.dotfiles/neovim/.config/nvim/pack/pb/start/tabular
git clone https://github.com/hashivim/vim-hashicorp-tools ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-hashicorp-tools
git clone https://github.com/junegunn/fzf                 ~/.dotfiles/neovim/.config/nvim/pack/pb/start/fzf
git clone https://github.com/junegunn/fzf.vim             ~/.dotfiles/neovim/.config/nvim/pack/pb/start/fzf.vim
git clone https://github.com/mattn/emmet-vim              ~/.dotfiles/neovim/.config/nvim/pack/pb/start/emmet-vim
git clone https://github.com/mzlogin/vim-markdown-toc     ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-markdown-toc
git clone https://github.com/plasticboy/vim-markdown      ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-markdown
git clone https://github.com/tpope/vim-apathy             ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-apathy
git clone https://github.com/tpope/vim-commentary         ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-commentary
git clone https://github.com/tpope/vim-dadbod             ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-dadbod
git clone https://github.com/tpope/vim-dispatch           ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-dispatch
git clone https://github.com/tpope/vim-fugitive           ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-fugitive
git clone https://github.com/tpope/vim-sensible           ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-sensible
git clone https://github.com/tpope/vim-sleuth             ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-sleuth
git clone https://github.com/tpope/vim-surround           ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-surround
git clone https://github.com/tpope/vim-vinegar            ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-vinegar
git clone https://github.com/vim-airline/vim-airline      ~/.dotfiles/neovim/.config/nvim/pack/pb/start/vim-airline
git clone https://github.com/vim-syntastic/syntastic      ~/.dotfiles/neovim/.config/nvim/pack/pb/start/syntastic
git clone https://github.com/w0rp/ale                     ~/.dotfiles/neovim/.config/nvim/pack/pb/start/ale
