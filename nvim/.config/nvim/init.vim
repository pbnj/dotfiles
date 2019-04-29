set nocompatible
syntax enable
filetype plugin on

if has('nvim')
  call plug#begin('~/.vim/plugged')

  " General
  Plug 'airblade/vim-gitgutter'
  Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
  Plug 'godlygeek/tabular'
  Plug 'hashivim/vim-hashicorp-tools'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf'
  Plug 'tpope/vim-apathy'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  map <Leader>e :NERDTreeToggle<CR>
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Config Files
  Plug 'cespare/vim-toml' , { 'for': 'toml' }
  Plug 'Quramy/vison'     , { 'for': 'json' }
  Plug 'elzr/vim-json'    , { 'for': 'json' }
  let g:vim_json_syntax_conceal = 0

  " Langs
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  Plug 'rust-lang/rust.vim'
  Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
  Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_folding_disabled = 1

  Plug 'w0rp/ale'
  let g:ale_set_quickfix = 1
  let g:ale_completion_enabled = 1
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'rust': ['rustfmt'],
  \   'markdown': ['prettier'],
  \   'yaml': ['prettier'],
  \   'go': ['goimports'],
  \}

  call plug#end()

set inccommand=split
endif " nvim-specific configs

set autowrite
set backspace=indent,eol,start
set hidden
set ignorecase
set incsearch
set laststatus=2
set list
set number
set path+=**
set relativenumber
set scrolloff=1
set showcmd
set smartcase
set wildmenu
set wrapmargin=2

map j gj
map k gk

" yaml
augroup yaml
  autocmd!
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" https://www.vi-improved.org/recommendations/
if executable("rg")
  set grepprg=rg\ --smart-case\ --vimgrep
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
