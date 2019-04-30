set nocompatible
syntax enable
filetype plugin on

set autowrite
set backspace=indent,eol,start
set colorcolumn=+2
set cursorline
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
set textwidth=78
set wildmenu

highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

map j gj
map k gk

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4

" rust
augroup rust
	autocmd!
	autocmd FileType rust setlocal formatprg=rustfmt\ --emit\ files
augroup END

" go
augroup go
	autocmd!
	autocmd FileType go setlocal formatprg=gofmt\ -w
augroup END

" yaml
augroup yaml
	autocmd!
	autocmd FileType yaml setlocal
		\ ts=2
		\ sts=2
		\ sw=2
		\ expandtab
		\ formatprg=prettier\ --parser\ yaml\ --prose-wrap=always\ --write
augroup END

" markdown
augroup markdown
	autocmd!
	autocmd FileType markdown setlocal
		\ ts=2
		\ sts=2
		\ sw=2
		\ expandtab
		\ formatprg=pandoc\ --from\ gfm\ --to\ gfm\ --columns=80
augroup END

" https://www.vi-improved.org/recommendations/
if executable("rg")
set grepprg=rg\ --smart-case\ --vimgrep
set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    +-- current column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer
