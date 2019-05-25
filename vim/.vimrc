set nocompatible
syntax enable
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""
"" SETTINGS: Options
""""""""""""""""""""""""""""""""""""""""
set autoindent
set autowrite
set background=dark
set backspace=indent,eol,start
set completeopt-=preview
set cursorline
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:\|\ ,trail:-
set nobackup
set noswapfile
set nowritebackup
set number
set path+=**
set relativenumber
set scrolloff=1
set shortmess-=F
set showcmd
set showtabline=2
set smartcase
set smarttab
set updatetime=250
set wildmenu

""""""""""""""""""""""""""""""""""""""""
"" SETTINGS: Mappings
""""""""""""""""""""""""""""""""""""""""
"" Leader
let mapleader = ","

"" Movements
map j gj
map k gk

"" Misc
nnoremap <Leader><space> :noh<CR>

"" Tab Autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

""""""""""""""""""""""""""""""""""""""""
"" FileType Settings
""""""""""""""""""""""""""""""""""""""""
augroup markdown
	autocmd!
	autocmd FileType markdown setlocal ts=2 sts=2 sw=2 tw=80 expandtab smarttab
augroup END
augroup yaml
	autocmd!
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab smarttab
augroup END

""""""""""""""""""""""""""""""""""""""""
"" Vi-IMproved Recommendations
"" source: https://www.vi-improved.org/recommendations/
""""""""""""""""""""""""""""""""""""""""
"" Search
if executable("rg")
	set grepprg=rg\ --smart-case\ --vimgrep
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"" Statusline
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
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

"" Getting around
nnoremap <leader>b :b <C-d>
nnoremap <leader>e :e **/
nnoremap <leader>g :grep<space>
nnoremap <leader>i :Ilist<space>
nnoremap <leader>j :tjump /
nnoremap <leader>m :make<cr>
nnoremap <leader>q :b#<cr>
nnoremap <leader>t :TTags<space>*<space>*<space>.<cr>

"" Completions
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

"" Strip White Spaces
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

autocmd BufWritePre * :call StripTrailingWhitespace()
