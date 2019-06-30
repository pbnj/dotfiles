""""""""""""""""""""""""""""""""""""""""
" Inspirations:
"       - https://github.com/robertmeta/vimfiles/
"       - https://www.vi-improved.org/recommendations/
""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin indent on
syntax off

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
""""""""""""""""""""""""""""""""""""""""

set autoindent
set background=dark
set backspace=indent,eol,start
set belloff=all
set breakindent
set colorcolumn=80
set completeopt-=preview
set conceallevel=0
set cursorline
set fileencoding=utf-8
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:\|\ ,trail:•
set noautoread
set noautowrite
set noautowriteall
set nobackup
set nomodeline
set noshowmode
set nospell
set noswapfile
set novisualbell
set nowritebackup
set number
set path+=**
set relativenumber
set ruler
set scrolloff=1
set showcmd
set showmatch
set showmode
set showtabline=2
set smartcase
set smarttab
set splitbelow
set splitright
set updatetime=250
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

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Appearance
""""""""""""""""""""""""""""""""""""""""

highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
