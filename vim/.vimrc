set nocompatible
syntax enable
filetype plugin on

set autowrite
set backspace=indent,eol,start
set hidden
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>\ ,trail:-
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

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4

" yaml
augroup yaml
autocmd!
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" markdown
augroup markdown
autocmd!
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" https://www.vi-improved.org/recommendations/
if executable("rg")
set grepprg=rg\ --smart-case\ --vimgrep
set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
