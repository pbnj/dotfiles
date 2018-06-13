" Inspired by: https://dougblack.io/words/a-good-vimrc.html
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" General
Plug 'bling/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimshell'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Languages
"" Arduino
Plug 'sudar/vim-arduino-syntax'
" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'ap/vim-css-color', { 'for': 'css' }
" Dart
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
"" Go
Plug 'zchee/deoplete-go', { 'do' : 'make', 'for': 'go' }
"" Docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
"" Go
Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries', 'for': 'go' }
"" Jenkins
Plug 'martinda/Jenkinsfile-vim-syntax'
"" Hashicorp
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-hclfmt'
Plug 'hashivim/vim-hashicorp-tools'
" HTML
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
"" Markdown
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
"" Misc
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'raimondi/delimitmate'
Plug 'sirver/ultisnips'
Plug 'w0rp/ale'
"" Node
Plug 'moll/vim-node'
Plug 'prettier/vim-prettier', { 'do' : 'npm install' }
" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Python
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

call plug#end()

filetype plugin indent on
syntax enable

let g:NERDSpaceDelims                      = 1
let g:UltiSnipsExpandTrigger               = "<tab>"
let g:airline#extensions#tabline#enabled   = 1
let g:airline_theme                        = "dracula"
let mapleader                              = ","
let maplocalleader                         = ",,"

set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set clipboard=unnamed
set cursorline
set encoding=utf8
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:¦·,
set mouse=a
set number
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smarttab
set splitbelow
set splitright
set tabstop=4
set termguicolors
set wildmenu

" Generic
" Make tab key switch between windows
" set autochdir
" autocmd BufEnter * silent! lcd %:p:h           " auto change directory based on current window
autocmd BufEnter * EnableStripWhitespaceOnSave " strip trailing whitespace on save

map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

colorscheme dracula

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
tnoremap <Esc> <C-\><C-n>

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

" ==============================
" Settings: Ale
" ==============================
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" ====================
" Language: Shell
" ====================
autocmd BufNewFile,BufRead *.sh,*.bash
    \ setlocal sts=2
    \ setlocal sw=2
    \ setlocal expandtab

" ====================
" Language: JS|TS|VUE
" ====================
autocmd BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx,*.vue
    \ setlocal sts=2
    \ setlocal sw=2
    \ setlocal expandtab

" ====================
" Language: TOML|YAML
" ====================
autocmd BufNewFile,BufRead *.toml,*.yml,*.yaml
    \ setlocal sts=2
    \ setlocal sw=2
    \ setlocal expandtab

" ====================
" Language: MARKDOWN
" ====================
autocmd BufNewFile,BufRead *.md
    \ setlocal sts=2
    \ setlocal sw=2
    \ setlocal expandtab

" ====================
" Language: VIM
" ====================
autocmd BufNewFile,BufRead *.vim
    \ setlocal sts=2 |
    \ setlocal sw=2 |
    \ setlocal expandtab |

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

  " I like these more!
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
" Language: JS
" From: https://prettier.io/docs/en/vim.html
" ==============================
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:prettier#autoformat                             = 0             " autosave files that have @format
autocmd BufNewFile,BufRead *.js,*.css,*.scss,*.less,*.json,*.md
    \ Prettier |
    \ setlocal sts=2 |
    \ setlocal sw=2 |
    \ setlocal expandtab |
let g:prettier#config#print_width                     = 80            " max line length for wrapping
let g:prettier#config#tab_width                       = 2             " number of spaces for indentation
let g:prettier#config#use_tabs                        = 'false'       " spaces vs tabs
let g:prettier#config#semi                            = 'false'       " semi colons
let g:prettier#config#single_quote                    = 'true'        " single vs double quotes
let g:prettier#config#bracket_spacing                 = 'false'       " print space inside parens
let g:prettier#config#jsx_bracket_same_line           = 'false'       " put > on last line or on new line
let g:prettier#config#trailing_comma                  = 'es5'         " none|es5|all
let g:prettier#config#parser                          = 'babylon'     " flow|babylon|typescript|postcss
let g:prettier#config#config_precedence               = 'prefer-file' " cli-override|file-override|prefer-file
let g:prettier#config#prose_wrap                      = 'none'    " always|never|preserve

" ==============================
" Language: PYTHON
" From: https://github.com/python-mode/python-mode
" ==============================
let g:pymode_python = 'python3'
autocmd BufNewFile,BufRead *.py
    \ setlocal tabstop=4
    \ setlocal softtabstop=4
    \ setlocal shiftwidth=4
    \ setlocal textwidth=79
    \ setlocal expandtab
    \ setlocal autoindent
    \ setlocal fileformat=unix
