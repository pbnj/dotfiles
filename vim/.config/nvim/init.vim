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

highlight clear FoldColumn
highlight clear Search
highlight clear SignColumn

highlight Search cterm=bold,underline
highlight TrailingWhiteSpace ctermbg=Red
match TrailingWhiteSpace /\s\+$/
""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
"""""""""""""""""""""""""""""""""""""""""

set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set breakindent
set cmdheight=2
set colorcolumn=80
set completeopt-=preview
set conceallevel=0
set display=lastline
set encoding=utf-8
set fileencoding=utf-8
set formatoptions+=j " remove comment leader when joining lines
set formatoptions+=n " when formatting text, recognize numbered lists
set formatoptions+=r " auto insert bullet point on new lines
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:\|\ ,trail:-,precedes:<,extends:>
set nobackup
set nomodeline
set nonumber
set nospell
set noswapfile
set novisualbell
set nowritebackup
set omnifunc=syntaxcomplete#Complete
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
set t_ut=""
set textwidth=80
set undodir=$HOME/.vim/undo
set undofile
set updatetime=250
set wildignorecase
set wildmenu
set wrap

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Mappings
""""""""""""""""""""""""""""""""""""""""

" Leader
" let g:mapleader="\<space>"

" Arrows
nmap <silent> <left> <esc>:lprev<cr>
nmap <silent> <right> <esc>:lnext<cr>
nmap <silent> <up> <esc>:cprev<cr>
nmap <silent> <down> <esc>:cnext<cr>

" Misc
nnoremap <Leader><space> :noh<CR>

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

  " General
  autocmd BufWritePost * :StripTrailingWhitespace
  autocmd InsertEnter,InsertLeave * set cul!

  " vim
  autocmd FileType vim setlocal ts=2 sw=2 expandtab smarttab

  " markdown
  autocmd FileType markdown setlocal ts=2 sw=2 expandtab smarttab

  " yaml
  autocmd FileType yaml setlocal ts=2 sw=2 expandtab smarttab

  " json
  autocmd FileType json setlocal ts=2 sw=2 expandtab smarttab
  autocmd FileType json syntax match Comment +\/\/.\+$+

  " Go
  autocmd BufWritePost *.go :silent ! goimports -w %

augroup END

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Functions & Commands
""""""""""""""""""""""""""""""""""""""""

" :Kube or :K commands
function! Kube( ... ) abort
  execute printf('!kubectl %s', join(a:000))
endfunction
command! -nargs=* Kube call Kube(<f-args>)

" :Git commands
function! Git( ... ) abort
  execute printf('!git %s', join(a:000))
endfunction
function! GitCompletion(A,L,P)
  return system("git help -a | grep \"^   [a-z]\" | awk '{print $1}'")
endfunction
command! -nargs=* -complete=custom,GitCompletion Git call Git(<f-args>)

" :Blame
function! s:GitBlame()
    let cmd = "git blame -w " . bufname("%")
    let nline = line(".") + 1
    botright new
    execute "$read !" . cmd
    execute "normal " . nline . "gg"
    execute "set filetype=perl"
endfunction
command! -nargs=* Blame call s:GitBlame()

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
command! StripTrailingWhitespace :call StripTrailingWhitespace()

function! GenerateTableOfContents()
  silent ! mdtoc --inplace %
  redraw!
endfunction
command! TOC :call GenerateTableOfContents()
