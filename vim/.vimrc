set nocompatible
syntax enable
filetype plugin on

call plug#begin('~/.vim/plugged')

" General
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'junegunn/fzf'
Plug 'majutsushi/tagbar'
Plug 'rhysd/git-messenger.vim'
nnoremap <Leader>gm <Plug>(git-messenger)
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit %<CR>
nnoremap <Leader>gp :Gpush<CR>
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'

" " Language Server Protocol Settings
" LanguageClient-neovim
" :UpdateRemotePlugins
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': ['gopls'],
    \ }

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
set completefunc=LanguageClient#complete

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Config Files
Plug 'cespare/vim-toml' , { 'for': 'toml' }
Plug 'Quramy/vison'	, { 'for': 'json' }
Plug 'elzr/vim-json'	, { 'for': 'json' }
let g:vim_json_syntax_conceal = 0

" " Langs
" " Rust
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim'

" " Go
" Plug 'myitcv/govim'
" let g:govim_format_on_save = "goimports"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"

" " Markdown
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
let g:vmt_list_item_char = "-"
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

call plug#end()

set autowrite
set background=light
set backspace=indent,eol,start
set hidden
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
set showcmd
set smartcase
set wildmenu

" colorscheme PaperColor

map j gj
map k gk

" netrw
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
nnoremap <Leader>e :Lexplore<CR>

" Autocomplete on TAB
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" https://www.vi-improved.org/recommendations/
if executable("rg")
    set grepprg=rg\ --smart-case\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
