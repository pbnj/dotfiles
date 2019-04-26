set nocompatible
syntax enable
filetype plugin on

set autowrite
set backspace=indent,eol,start
set hidden
set incsearch
set laststatus=2
set list
set listchars+=eol:¬,extends:≥,precedes:≤,tab:>-,trail:-
set number
set path+=**
set scrolloff=1
set showcmd
set smartcase
set wildmenu

let mapleader=","

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

map j gj
map k gk
nnoremap <leader>b :b <C-d>
nnoremap <leader>g :grep<space>

" https://www.vi-improved.org/recommendations/
if executable("ripgrep")
  set grepprg=rg\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
