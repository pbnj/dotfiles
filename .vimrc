" Inspired by: https://dougblack.io/words/a-good-vimrc.html
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/vimshell'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'        , {'for' : 'Dockerfile'}
Plug 'elzr/vim-json'                  , {'for' : 'json'}
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'                   , { 'do': ':GoInstallBinaries' }
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'prettier/vim-prettier'          , { 'do': 'npm install' }
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

call plug#end()

" Generic
autocmd BufEnter * silent! lcd %:p:h "auto change directory based on current window
autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

syntax enable
colorscheme base16-default-dark

filetype indent on

let g:NERDSpaceDelims        = 1
let g:UltiSnipsExpandTrigger = "<tab>"
let mapleader                = ","
let maplocalleader           = ",,"

set autowrite
set backspace=indent,eol,start
set clipboard=unnamed
set cursorline
set encoding=utf8
set hlsearch
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«,nbsp:•
set mouse=a
set number
set relativenumber
set showcmd
set showmatch
set splitbelow
set splitright
set t_Co=256
set termguicolors
set wildmenu

" ==============================
" Keybindings
" ==============================

" Generic
map <C-e> :NERDTreeToggle<CR>
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
let g:prettier#config#prose_wrap                      = 'preserve'    " always|never|preserve
