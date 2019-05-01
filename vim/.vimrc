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
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
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
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
map <Leader>e :NERDTreeToggle<CR>

" Language Server Protocol Settings
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

let g:lsp_preview_keep_focus = 0
let g:lsp_async_completion = 1
" Debugging LSP
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

nmap <Leader>ld <plug>(lsp-definition)
nmap <Leader>ls <plug>(lsp-document-symbol)
nmap <Leader>lh <plug>(lsp-hover)
nmap <Leader>le <plug>(lsp-document-diagnostics)
nmap <Leader>lne <plug>(lsp-next-error)
nmap <Leader>lpe <plug>(lsp-previous-error)
nmap <Leader>lnr <plug>(lsp-next-reference)
nmap <Leader>lpr <plug>(lsp-previous-reference)
nmap <Leader>lr <plug>(lsp-references)

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

" let g:ale_completion_enabled = 1 " must be set before w0rp/ale is loaded per docs
" let g:ale_set_quickfix = 1 " in order to navigate with :cnext, :cprevious, :cfirst, :clast, :clist
" let g:ale_fix_on_save = 1
" let g:ale_set_balloons = 1
" let g:ale_fixers = {
"             \   '*': ['remove_trailing_lines', 'trim_whitespace'],
"             \   'rust': ['rustfmt'],
"             \   'markdown': ['prettier'],
"             \   'yaml': ['prettier'],
"             \   'go': ['goimports'],
"             \}
" Plug 'w0rp/ale'

" Config Files
Plug 'cespare/vim-toml' , { 'for': 'toml' }
Plug 'Quramy/vison'	, { 'for': 'json' }
Plug 'elzr/vim-json'	, { 'for': 'json' }
let g:vim_json_syntax_conceal = 0

" Langs
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim'

"" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_cmd = "goimports"

Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

call plug#end()

set autowrite
set backspace=indent,eol,start
set ballooneval
set balloonevalterm
set hidden
set ignorecase
set incsearch
set laststatus=2
set list
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set number
set path+=**
set relativenumber
set scrolloff=1
set showcmd
set smartcase
set ttymouse=sgr
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
