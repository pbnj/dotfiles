""""""""""""""""""""""""""""""""""""""""
" Inspirations:
"       - https://github.com/robertmeta/vimfiles/
"       - https://www.vi-improved.org/recommendations/
""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'Quramy/vison'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mzlogin/vim-markdown-toc'
Plug 'natebosch/vim-lsc'
Plug 'plasticboy/vim-markdown'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tsandall/vim-rego'
Plug 'uarun/vim-protobuf'

Plug 'nanotech/jellybeans.vim'

call plug#end()

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
set foldclose=all
set foldcolumn=0
set foldenable
set foldlevel=10
set foldmethod=syntax
set foldnestmax=1
set foldopen=all
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:\|\ ,trail:-
set noautoread
set noautowrite
set noautowriteall
set nobackup
set nomodeline
set nonumber
set norelativenumber
set noshowmode
set nospell
set noswapfile
set novisualbell
set nowritebackup
set path+=**
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
" SETTINGS: Plugins
""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeDirArrowCollapsible="-"
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeHijackNetrw=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1

" lightline

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" vim-rooter
let g:rooter_use_lcd = 1

" vim-markdown-toc
let g:vmt_list_item_char = '-'

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Mappings
""""""""""""""""""""""""""""""""""""""""

" Leader
let g:mapleader="\<space>"

" NERDTree
nnoremap - :NERDTreeToggle<cr>

" Git
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit %<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gpull :Gpull<CR>
nmap <Leader>gpush :Gpush<CR>
nmap <Leader>gbrow :Gbrowse<CR>

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

" Completions
inoremap <silent> ;f <c-x><c-f>
inoremap <silent> ;i <c-x><c-i>
inoremap <silent> ;l <c-x><c-l>
inoremap <silent> ;n <c-x><c-n>
inoremap <silent> ;o <c-x><c-o>
inoremap <silent> ;p <c-x><c-p>
inoremap <silent> ;t <c-x><c-]>
inoremap <silent> ;u <c-x><c-u>

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: FileTypes
""""""""""""""""""""""""""""""""""""""""

augroup general
  autocmd!
  autocmd FileType vim setlocal ts=2 sw=2 expandtab smarttab
  autocmd FileType markdown setlocal ts=2 sw=2 expandtab smarttab
  autocmd FileType yaml setlocal ts=2 sw=2 expandtab smarttab
augroup END

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Colors & Highlights
""""""""""""""""""""""""""""""""""""""""

colorscheme jellybeans

highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
