set nocompatible
syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""
""" Git
Plug 'airblade/vim-gitgutter'
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
Plug 'tpope/vim-fugitive'
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit %<CR>
nnoremap <Leader>gp :Gpush<CR>
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'
Plug 'rhysd/git-messenger.vim'
nnoremap <Leader>gm <Plug>(git-messenger)

""" tpope
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

""" Miscellaneous Plugins
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
nnoremap <Leader>e :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
Plug 'itchyny/lightline.vim'
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'fugitive#head'
			\ },
			\ }

""""""""""""""""""""""""""""""""""""""""
"" Languages
""""""""""""""""""""""""""""""""""""""""
""" Rust
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim'

""" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

""" Markdown
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
let g:vmt_list_item_char = "-"
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

""" Config Files
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'hashivim/vim-hashicorp-tools'
Plug 'cespare/vim-toml' , { 'for': 'toml' }
Plug 'Quramy/vison'	, { 'for': 'json' }
Plug 'elzr/vim-json'	, { 'for': 'json' }
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""""""""""""""""""
"" Languages Server Protocol Settings
""""""""""""""""""""""""""""""""""""""""
""" ALE
let g:ale_completion_enabled = 1
let g:ale_linters = {
			\ 'go': ['golint', 'gopls'],
			\ 'yaml': ['yaml-language-server'],
			\}
Plug 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
			\ '*': ['remove_trailing_lines', 'trim_whitespace'],
			\ 'go': ['goimports'],
			\ 'rust': ['rustfmt'],
			\ 'sh': ['shfmt'],
			\ 'yaml': ['prettier'],
			\ 'json': ['prettier'],
			\ 'markdown': ['prettier'],
			\}

call plug#end()

""""""""""""""""""""""""""""""""""""""""
"" General Settings
""""""""""""""""""""""""""""""""""""""""
set autowrite
set background=light
set backspace=indent,eol,start
set cursorline
set hidden
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:\|\ ,trail:-
set nobackup
set noshowmode
set noswapfile
set nowritebackup
set number
set path+=**
set relativenumber
set scrolloff=1
set showcmd
set showtabline=2
set smartcase
set smarttab
set wildmenu

colorscheme PaperColor

""" Mappings
map j gj
map k gk

""" Autocomplete on TAB
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

""" FileType Settings
" augroup markdown
"     autocmd FileType markdown setlocal ts=2 sts=2 sw=2 tw=80 expandtab smarttab
" augroup END
" augroup yaml
"     autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab smarttab
" augroup END

" https://www.vi-improved.org/recommendations/
if executable("rg")
	set grepprg=rg\ --smart-case\ --vimgrep
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
