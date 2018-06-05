filetype off
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('dracula/vim', { 'name': 'dracula' })
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Shougo/deol.nvim')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('ekalinin/Dockerfile.vim', { 'on_ft' : 'Dockerfile' })
  call dein#add('ervandew/supertab')
  call dein#add('godlygeek/tabular')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('raimondi/delimitmate')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('tpope/vim-surround')
  call dein#add('w0rp/ale')
  " Plug 'sirver/ultisnips'
  let g:deoplete#enable_at_startup = 1
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Languages
  "" Dart
  call dein#add('dart-lang/dart-vim-plugin', { 'on_ft': 'dart' })

  "" JS/Node
  call dein#add('mhartington/nvim-typescript' , { 'build': './install.sh'   , 'on_ft': 'javascript' })
  call dein#add('leafgarland/typescript-vim'  , { 'on_ft': 'typescript' })
  call dein#add('moll/vim-node'               , { 'on_ft': 'javascript' })
  call dein#add('mxw/vim-jsx'                 , { 'on_ft': 'javascript' })
  call dein#add('pangloss/vim-javascript'     , { 'on_ft': 'javascript' })
  call dein#add('prettier/vim-prettier'       , { 'build': 'npm install' })

  "" Markdown
  call dein#add('mzlogin/vim-markdown-toc' , { 'on_ft': 'markdown' })
  call dein#add('tpope/vim-markdown'       , { 'on_ft': 'markdown' })

  "" Go
  call dein#add('fatih/vim-go'      , { 'build': ':GoInstallBinaries', 'on_ft': 'go' })
  call dein#add('zchee/deoplete-go' , { 'build': 'make', 'on_ft': 'go' })

  "" JSON/YAML/TOML
  call dein#add('cespare/vim-toml' , { 'on_ft': 'toml' })
  call dein#add('elzr/vim-json'    , { 'on_ft': 'json' })
  call dein#add('stephpy/vim-yaml' , { 'on_ft': 'yaml' })

  "" Rust
  call dein#add('rust-lang/rust.vim'   , { 'on_ft': 'rust' })
  call dein#add('racer-rust/vim-racer' , { 'on_ft': 'rust' })

  "" Python
  call dein#add('python-mode/python-mode', { 'rev': 'develop' })

  "" Ruby
  call dein#add('vim-ruby/vim-ruby', { 'on_ft': 'ruby' })

  " Tools
  "" Hashicorp
  call dein#add('b4b4r07/vim-hcl')
  call dein#add('fatih/vim-hclfmt')
  call dein#add('hashivim/vim-hashicorp-tools')

  call dein#end()
  call dein#save_state()

  if dein#check_install()
    call dein#install()
  endif
endif

filetype plugin indent on
syntax enable

" Generic
autocmd BufEnter * silent! lcd %:p:h           " auto change directory based on current window
autocmd BufEnter * EnableStripWhitespaceOnSave " strip trailing whitespace on save

let g:NERDSpaceDelims                      = 1
let g:UltiSnipsExpandTrigger               = "<tab>"
let mapleader                              = ","
let maplocalleader                         = ",,"
" Theme for vim/neovim
let g:airline_theme                        = "dracula"
let g:airline#extensions#tabline#enabled   = 1

set autowrite
set background=dark
set backspace=indent,eol,start
set clipboard=unnamed
set cursorline
set encoding=utf8
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:¦·,
set mouse=a
set number
set showcmd
set showmatch
set smartcase
set splitbelow
set splitright
set wildmenu
set termguicolors

" Make tab key switch between windows
set autochdir
map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

colorscheme dracula

autocmd FileType js setlocal sts=2 sw=2 expandtab smarttab
autocmd FileType json setlocal sts=2 sw=2 expandtab smarttab
autocmd FileType yaml setlocal sts=2 sw=2 expandtab smarttab
autocmd FileType md setlocal sts=2 sw=2 expandtab smarttab
autocmd FileType vim setlocal sts=2 sw=2 expandtab smarttab

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
let g:prettier#autoformat                             = 0             " autosave files that have @format
autocmd BufWritePre *.js,*.css,*.scss,*.less,*.json,*.md Prettier
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
