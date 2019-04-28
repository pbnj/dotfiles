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
set listchars=trail:-,tab:>-,precedes:≤,extends:≥
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

" https://www.vi-improved.org/recommendations/
if executable("rg")
  set grepprg=rg\ --smart-case\ --vimgrep
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
