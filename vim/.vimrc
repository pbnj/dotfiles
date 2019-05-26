""""""""""""""""""""""""""""""""""""""""
" Inspirations:
"	- https://github.com/robertmeta/vimfiles/
"	- https://www.vi-improved.org/recommendations/
"	- https://shapeshed.com/vim-packages/
""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
""""""""""""""""""""""""""""""""""""""""

set autoindent
set background=dark
set backspace=indent,eol,start
set belloff=all
set breakindent
set completeopt-=preview
set conceallevel=0
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
set nocursorline
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

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Mappings
""""""""""""""""""""""""""""""""""""""""

" Leader
let g:mapleader="\<space>"

" NERDTree
nnoremap - :NERDTreeFocus<cr>

" Git
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

nmap <Leader>Gs :Gstatus<CR>
nmap <Leader>Gc :Gcommit %<CR>
nmap <Leader>Gb :Gblame<CR>
nmap <Leader>Gpull :Gpull<CR>
nmap <Leader>Gpush :Gpush<CR>
nmap <Leader>Gbrow :Gbrowse<CR>

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
nnoremap <Leader>g :grep<space>
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
	autocmd FileType markdown setlocal sts=2 sw=2 expandtab smarttab spell
	autocmd FileType yaml setlocal sts=2 sw=2 expandtab smarttab
augroup END
