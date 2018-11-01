call plug#begin('~/.vim/plugged')

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

call plug#end()

filetype plugin indent on

" Addressed via vim-sensible plugin
" set autoread
" set backspace=2
" set incsearch
" set listchars=tab:>-,trail:-,precedes:<,extends:>
" set scrolloff=1
set autoindent
set foldmethod=syntax
set hidden
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set list
set nobackup
set noswapfile
set number
set ruler
set showcmd
set showmode
set smartcase
set smartindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set ttyfast
set wildmode=longest,list
set wrap

let mapleader = ','
let g:NERDSpaceDelims = 1

let g:terraform_fmt_on_save=1

let g:ale_fix_on_save = 1
let g:ale_fixers      = {
\ '*': ['trim_whitespace', 'remove_trailing_lines'],
\ 'javascript': ['prettier', 'eslint'],
\ 'markdown': ['prettier'],
\ 'json': ['prettier'],
\ 'sh': ['shfmt'],
\ 'yaml': ['prettier'],
\}
