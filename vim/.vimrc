set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"" General
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimshell'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yggdroot/indentline'

"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

"" Themes
" Plug 'flazz/vim-colorschemes'
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'

"" Languages
" Arduino
Plug 'sudar/vim-arduino-syntax'
" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'ap/vim-css-color', { 'for': 'css' }
" Dart
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
" Docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
" Go
Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries', 'for': 'go' }
Plug 'zchee/vim-vgo', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do' : 'make', 'for': 'go' }
" Jenkins
Plug 'martinda/Jenkinsfile-vim-syntax'
" Hashicorp
Plug 'b4b4r07/vim-hcl', { 'for': 'hcl' }
Plug 'fatih/vim-hclfmt', { 'for': 'hcl', 'do': 'go get -u -v github.com/fatih/hclfmt' }
Plug 'hashivim/vim-hashicorp-tools'
" Plug 'hashivim/vim-vaultproject'
" Plug 'hashivim/vim-vagrant'
" Plug 'hashivim/vim-terraform'
" Plug 'hashivim/vim-packer'
" Plug 'hashivim/vim-nomadproject'
" Plug 'hashivim/vim-consul'
" HTML
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
" Kubernetes
Plug 'c9s/vikube.vim'
Plug 'andrewstuart/vim-kubernetes'
Plug 'technosophos/vim-kubernetes-snippets'
" Markdown
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Misc
Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'
Plug 'sirver/ultisnips'
Plug 'w0rp/ale'
" Node
Plug 'moll/vim-node' " Vim utilities for node projects
" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" JSON
Plug 'elzr/vim-json', { 'for': 'json' }
" Python
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }
" TravisCI
Plug 'keith/travis.vim'
" YAML
Plug 'chase/vim-ansible-yaml', { 'for': ['yaml', 'yml'] }

call plug#end()

filetype plugin indent on
syntax enable

set autochdir
set autoread
set autowrite
set backspace=indent,eol,start
set clipboard=unnamed
set cursorline
set encoding=utf8
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set mouse=a
set number
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set wildmenu

set tabstop=4
set shiftwidth=4

let g:better_whitespace_enabled           = 1
let g:strip_whitespace_on_save            = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level           = 1
let g:NERDSpaceDelims                     = 1
let g:UltiSnipsExpandTrigger              = "<tab>"
let g:airline#extensions#tabline#enabled  = 1
let mapleader                             = ","
let maplocalleader                        = ",,"

" Generic
" Make tab key switch between windows
" autocmd BufEnter * silent! lcd %:p:h           " auto change directory based on current window
" map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

function! Format()
  " Don't format if filetype is blank
  if &ft==''
    return
  endif
  normal migg=G`i
endfunction

augroup format
  autocmd!
  autocmd BufWritePre,BufEnter * call Format()
augroup End


" set termguicolors " Enable for iTerm / Disable for Terminal.app
" set t_Co=256
set background=light
colorscheme PaperColor

" ==============================
" Settings: Autocompletion
" ==============================
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ==============================
" Settings: Keybindings
" ==============================
" Generic
map <C-f> :NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap gV `[v`]
nnoremap j gj
nnoremap k gk

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enabling folding with <space>
nnoremap <space> za

" Git
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gp :Gpush<CR>

" Terminal
"tnoremap <Esc> <C-\><C-n>

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

" ==============================
" Settings: Ale
" ==============================
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save                = 1
let g:ale_completion_enabled         = 1
let g:ale_sign_column_always         = 1
let g:ale_fixers                     = {
      \ 'javascript': ['prettier'],
      \ 'sh': ['shfmt']
      \ }

" ====================
" Language: Shell
" ====================
" augroup shell
" autocmd!
" autocmd BufNewFile,BufRead *.sh,*.bash
" \ setlocal ts=4 |
" \ setlocal sw=4 |
" \ setlocal noexpandtab
" autocmd FileType sh,conf
" \ setlocal ts=4 |
" \ setlocal sw=4 |
" \ setlocal noexpandtab
" augroup END

" ====================
" Language: Config
" ====================
let g:vim_json_syntax_conceal = 0
augroup config
  autocmd!
  autocmd BufNewFile,BufRead *.toml,*.yml,*.yaml,*.json
        \ setlocal ts=2 |
        \ setlocal sw=2 |
        \ setlocal expandtab
  autocmd FileType toml,yml,yaml,json
        \ setlocal ts=2 |
        \ setlocal sw=2 |
        \ setlocal expandtab
augroup END

augroup makefile
  autocmd!
  autocmd FileType make
        \ setlocal ts=4 |
        \ setlocal sw=4 |
        \ setlocal noexpandtab
augroup END

" ====================
" Language: JS|TS|VUE
" ====================
augroup node
  autocmd!
  autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx,*.vue
        \ setlocal ts=2 |
        \ setlocal sw=2 |
        \ setlocal expandtab
augroup END

" ====================
" Language: MARKDOWN
" ====================
let g:vim_markdown_conceal          = 0
let g:vim_markdown_folding_disabled = 1
augroup markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md
        \ setlocal ts=2 |
        \ setlocal sw=2 |
        \ setlocal expandtab
augroup END

" ====================
" Language: VIM
" ====================
augroup vimrc
  autocmd!
  autocmd BufNewFile,BufRead *.vim
        \ setlocal ts=2 |
        \ setlocal sw=2 |
        \ setlocal expandtab
augroup END

" ==============================
" Language: GO
" All of these vim-go configurations came from: https://github.com/fatih/vim-go-tutorial
" ==============================
" For autocompletion

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!
  autocmd FileType go
        \ setlocal ts=4 |
        \ setlocal sw=4 |
        \ setlocal noexpandtab
  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-doc-split)
  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
  autocmd Filetype go command! -bang A  call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

let g:syntastic_go_checkers = ['go']
let g:go_fmt_command        = "goimports"
let g:go_list_type          = "quickfix"
let g:go_def_mode           = "guru"
let g:go_info_mode          = "guru"
let g:go_autodetect_gopath  = 1
" let g:go_auto_type_info   = 1
" set updatetime            = 100

" Enable Go syntax highlighting.
" If perf is significantly impacted, remove or disable highlighting below
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_types             = 1
let g:go_highlight_fields            = 1
let g:go_highlight_operators         = 1
let g:go_highlight_extra_types       = 1
let g:go_highlight_build_constraints = 1

" ==============================
" Language: PYTHON
" From: https://github.com/python-mode/python-mode
" ==============================
let g:pymode_python = 'python3'
augroup python
  autocmd!
  autocmd BufNewFile,BufRead *.py
        \ setlocal ts=4 |
        \ setlocal sw=4 |
        \ setlocal textwidth=79 |
        \ setlocal expandtab |
        \ setlocal autoindent |
        \ setlocal fileformat=unix
augroup END
