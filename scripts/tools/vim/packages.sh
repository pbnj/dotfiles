#!/bin/bash

set -x

# Vim 8 introduced a native package manager
# Packages need to be under ~/.vim/pack/foo/start, where `foo` is any name you want it to be
# Packages under this path will be autoloaded
# For more info: https://shapeshed.com/vim-packages/

git submodule add https://github.com/airblade/vim-gitgutter 	  vim/.vim/pack/petermbenjamin/start/vim-gitgutter
git submodule add https://github.com/cespare/vim-toml       	  vim/.vim/pack/petermbenjamin/start/vim-toml
git submodule add https://github.com/ekalinin/Dockerfile.vim      vim/.vim/pack/petermbenjamin/start/Dockerfile.vim
git submodule add https://github.com/elzr/vim-json                vim/.vim/pack/petermbenjamin/start/vim-json
git submodule add https://github.com/ervandew/supertab            vim/.vim/pack/petermbenjamin/start/supertab
git submodule add https://github.com/fatih/vim-go                 vim/.vim/pack/petermbenjamin/start/vim-go
git submodule add https://github.com/godlygeek/tabular            vim/.vim/pack/petermbenjamin/start/tabular
git submodule add https://github.com/hashivim/vim-hashicorp-tools vim/.vim/pack/petermbenjamin/start/vim-hashicorp-tools
git submodule add https://github.com/mzlogin/vim-markdown-toc     vim/.vim/pack/petermbenjamin/start/vim-markdown-toc
git submodule add https://github.com/plasticboy/vim-markdown 	  vim/.vim/pack/petermbenjamin/start/vim-markdown
git submodule add https://github.com/tpope/vim-apathy             vim/.vim/pack/petermbenjamin/start/vim-apathy
git submodule add https://github.com/tpope/vim-commentary         vim/.vim/pack/petermbenjamin/start/vim-commentary
git submodule add https://github.com/tpope/vim-dadbod             vim/.vim/pack/petermbenjamin/start/vim-dadbod
git submodule add https://github.com/tpope/vim-dispatch           vim/.vim/pack/petermbenjamin/start/vim-dispatch
git submodule add https://github.com/tpope/vim-fugitive           vim/.vim/pack/petermbenjamin/start/vim-fugitive
git submodule add https://github.com/tpope/vim-sensible           vim/.vim/pack/petermbenjamin/start/vim-sensible
git submodule add https://github.com/tpope/vim-sleuth             vim/.vim/pack/petermbenjamin/start/vim-sleuth
git submodule add https://github.com/tpope/vim-surround           vim/.vim/pack/petermbenjamin/start/vim-surround
git submodule add https://github.com/tpope/vim-vinegar            vim/.vim/pack/petermbenjamin/start/vim-vinegar
git submodule add https://github.com/vim-airline/vim-airline      vim/.vim/pack/petermbenjamin/start/vim-airline

# updating packages
# git submodule update --remote --merge
# git commit

# removing packages
# git submodule deinit vim/pack/shapeshed/start/vim-airline
# git rm vim/pack/shapeshed/start/vim-airline
# rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
# git commit

git submodule add https://github.com/airblade/vim-gitgutter 	  nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-gitgutter
git submodule add https://github.com/cespare/vim-toml       	  nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-toml
git submodule add https://github.com/ekalinin/Dockerfile.vim      nvim/.local/share/nvim/site/pack/petermbenjamin/start/Dockerfile.vim
git submodule add https://github.com/elzr/vim-json                nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-json
git submodule add https://github.com/ervandew/supertab            nvim/.local/share/nvim/site/pack/petermbenjamin/start/supertab
git submodule add https://github.com/fatih/vim-go                 nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-go
git submodule add https://github.com/godlygeek/tabular            nvim/.local/share/nvim/site/pack/petermbenjamin/start/tabular
git submodule add https://github.com/hashivim/vim-hashicorp-tools nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-hashicorp-tools
git submodule add https://github.com/mzlogin/vim-markdown-toc     nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-markdown-toc
git submodule add https://github.com/plasticboy/vim-markdown 	  nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-markdown
git submodule add https://github.com/tpope/vim-apathy             nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-apathy
git submodule add https://github.com/tpope/vim-commentary         nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-commentary
git submodule add https://github.com/tpope/vim-dadbod             nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-dadbod
git submodule add https://github.com/tpope/vim-dispatch           nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-dispatch
git submodule add https://github.com/tpope/vim-fugitive           nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-fugitive
git submodule add https://github.com/tpope/vim-sensible           nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-sensible
git submodule add https://github.com/tpope/vim-sleuth             nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-sleuth
git submodule add https://github.com/tpope/vim-surround           nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-surround
git submodule add https://github.com/tpope/vim-vinegar            nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-vinegar
git submodule add https://github.com/vim-airline/vim-airline      nvim/.local/share/nvim/site/pack/petermbenjamin/start/vim-airline

