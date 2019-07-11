""""""""""""""""""""""""""""""""""""""""
" Inspirations:
"       - https://github.com/robertmeta/vimfiles/
"       - https://www.vi-improved.org/recommendations/
""""""""""""""""""""""""""""""""""""""""

set nocompatible

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Appearance
""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
syntax on
" curl -Lo ~/.vim/colors/monotone.vim https://github.com/Lokaltog/vim-monotone/raw/master/colors/monotone.vim
colorscheme monotone

highlight StatusLine          ctermfg=Black ctermbg=LightGrey cterm=bold
highlight StatusLineNC        ctermfg=Black ctermbg=LightGrey cterm=bold
highlight TrailingWhiteSpace                ctermbg=Red
match TrailingWhiteSpace /\s\+$/

" Statusline
set statusline=%f%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
""""""""""""""""""""""""""""""""""""""""

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set belloff=all
set breakindent
set colorcolumn=80
set completeopt-=preview
set conceallevel=0
set cursorline
set display=lastline
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=indent
set formatoptions+=j
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:\|\ ,trail:-,eol:¬,precedes:<,extends:>
set noautoread
set noautowrite
set noautowriteall
set nobackup
set nomodeline
set norelativenumber
set noshowmode
set nospell
set noswapfile
set novisualbell
set nowritebackup
set number
set path+=**
set ruler
set scrolloff=1
set showcmd
set showmatch
set showmode
set smartcase
set smarttab
set splitbelow
set splitright
set updatetime=250
set wildignorecase
set wildmenu
set wrap

" Search
if executable("rg")
  set grepprg=rg\ --smart-case\ --vimgrep
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Mappings
""""""""""""""""""""""""""""""""""""""""

" Leader
let g:mapleader="\<space>"

" netrw
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" Movements
map j gj
map k gk

" Arrows
nmap <silent> <left> <esc>:lprev<cr>
nmap <silent> <right> <esc>:lnext<cr>
nmap <silent> <up> <esc>:cprev<cr>
nmap <silent> <down> <esc>:cnext<cr>

" Misc
nnoremap <Leader><space> :noh<CR>

" Tab Autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Getting around
nnoremap <Leader>b :b <C-d>
nnoremap <Leader>e :e **/
nnoremap <Leader>i :Ilist<space>
nnoremap <Leader>j :tjump /
nnoremap <Leader>m :make<cr>
nnoremap <Leader>q :b#<cr>
nnoremap <Leader>t :TTags<space>*<space>*<space>.<cr>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l


""""""""""""""""""""""""""""""""""""""""
" SETTINGS: FileTypes
""""""""""""""""""""""""""""""""""""""""

augroup general
  autocmd!
  autocmd FileType vim setlocal ts=2 sw=2 expandtab smarttab
  autocmd FileType markdown setlocal ts=2 sw=2 expandtab smarttab
  autocmd FileType yaml setlocal ts=2 sw=2 expandtab smarttab
  autocmd FileType json setlocal ts=2 sw=2 expandtab smarttab
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Functions & Commands
""""""""""""""""""""""""""""""""""""""""

function! Kube( ... ) abort
  execute printf('!kubectl %s', join(a:000))
endfunction
command! -nargs=* Kube call Kube(<f-args>)

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
