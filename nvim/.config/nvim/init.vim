call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'             , { 'for': 'toml' }
Plug 'ekalinin/Dockerfile.vim'      , { 'for': 'dockerfile' }
Plug 'elzr/vim-json'                , { 'for': 'json' }
Plug 'fatih/vim-go'                 , { 'for': 'go'           , 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'mzlogin/vim-markdown-toc'     , { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown'      , { 'for': 'markdown' }
Plug 'rust-lang/rust.vim'           , { 'for': 'rust' }
Plug 'Quramy/vison'                 , { 'for': 'json' }
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'

call plug#end()

set autowrite
set backspace=indent,eol,start
set hidden
set inccommand=split
set incsearch
set laststatus=2
set list
set number
set path+=**
set scrolloff=1
set showcmd
set smartcase
set wildmenu

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_json_syntax_conceal = 0

map j gj
map k gk

" https://www.vi-improved.org/recommendations/
if executable("ripgrep")
  set grepprg=rg\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
