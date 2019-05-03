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
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
map <Leader>e :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Language Server Protocol Settings

" LanguageClient-neovim

" curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
" source $HOME/.bash_profile
" nvm install --lts
" npm i -g yarn || curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
autocmd FileType json syntax match Comment +\/\/.\+$+
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" " :UpdateRemotePlugins
" Plug 'autozimu/LanguageClient-neovim', {
"       \ 'branch': 'next',
"       \ 'do': 'bash install.sh',
"       \ }

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'go': ['gopls'],
"     \ }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"

" " Markdown
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

call plug#end()

set autowrite
set backspace=indent,eol,start
set hidden
set ignorecase
set incsearch
set laststatus=2
set list
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

map j gj
map k gk

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
