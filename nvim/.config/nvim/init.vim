set nocompatible
syntax enable
filetype plugin on

call plug#begin('~/.vim/plugged')

" General
Plug 'airblade/vim-gitgutter'
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
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
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
nnoremap <Leader>e :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'

" " Language Server Protocol Settings

" " ALE
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

" " Markdown
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
let g:vmt_list_item_char = "-"
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

Plug 'flazz/vim-colorschemes'

call plug#end()

"" General Settings
set autowrite
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
set smarttab
set wildmenu

"" Mappings
map j gj
map k gk

""" Autocomplete on TAB
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"" FileType Settings
augroup markdown
    autocmd FileType markdown setlocal ts=2 sts=2 sw=2 cc=+2 expandtab smarttab
augroup END
augroup yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab smarttab
augroup END

" https://www.vi-improved.org/recommendations/
if executable("rg")
    set grepprg=rg\ --smart-case\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
