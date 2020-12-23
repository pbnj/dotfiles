" this is redundant, but I prefer explicit settings over implicit/default
" behavior
set nocompatible

" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

"=======
" Misc.
"=======
" git gutter
Plug 'mhinz/vim-signify'
" highlight yanks
Plug 'machakann/vim-highlightedyank'
" alignment
Plug 'godlygeek/tabular'
" fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" text objects
Plug 'wellle/targets.vim'
" startup time debugger
Plug 'tweekmonster/startuptime.vim'
" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
" statusline
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" colorscheme
Plug 'arcticicestudio/nord-vim'
Plug 'haishanh/night-owl.vim'

"=======
" tpope
"=======
Plug 'tpope/vim-dadbod' | Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive' | Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'

"===========
" Languages
"===========
" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" rust
Plug 'rust-lang/rust.vim'
" toml
Plug 'cespare/vim-toml'
" json
Plug 'elzr/vim-json'
Plug 'Quramy/vison'
" markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" test Runner
Plug 'janko/vim-test'
" tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" hashicorp tools
Plug 'hashivim/vim-hashicorp-tools'

call plug#end()

" enable filetype detection
filetype on
" enable filetype-specific indenting
filetype indent on
" enable filetype-specific plugins
filetype plugin on

syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neovim specific settings
if has('nvim')
  set inccommand=split
endif

if has('termguicolors')
  set termguicolors
endif

augroup sign_column
  autocmd!
  autocmd InsertEnter * setlocal cursorline
  autocmd InsertLeave * setlocal nocursorline
augroup END

set background=dark
colorscheme night-owl

""""""""""""""""""""""""""""""""""""""""
" FILE EXPLORER
""""""""""""""""""""""""""""""""""""""""

" disable netrw
" let g:loaded_netrwPlugin = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 25

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set breakindent
set clipboard=unnamed,unnamedplus
set cmdheight=2
set colorcolumn=+1
set completeopt=menu,noinsert,noselect
set conceallevel=0
set display+=lastline
set encoding=utf-8
set fileencoding=utf-8
set formatoptions+=j " remove comment leader when joining lines
set formatoptions+=n " when formatting text, recognize numbered lists
set formatoptions-=t " don't auto-wrap text using textwidth
set guifont=JetBrainsMono\ Nerd\ Font
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:\|\ ,extends:≫,precedes:≪,nbsp:·,trail:·
set mouse=a
set nobackup
set nocursorline
set nofoldenable
set nomodeline
set norelativenumber
set noshowcmd
set noshowmode
set nospell
set noswapfile
set novisualbell
set nowrap
set nowrapscan " stop searching at end of file. do not restart search from top
set nowritebackup
set number
set path+=**
set pumheight=10
set ruler
set scrolloff=1
set secure
set shortmess+=c
set showmatch
set sidescrolloff=5
set signcolumn=yes
set smartcase
set smarttab
set splitbelow
set splitright
set t_ut=
set tags+=tags
set textwidth=79
set ttyfast
set undodir=$HOME/.vim/undo
set undofile
set updatetime=100
set wildignorecase
set wildmenu
set wildmode=longest,full

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

if findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" misc
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS & COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: move to ftplugin/markdown.vim
" markdown TOC
" yarn global add doctoc
function! GenTOC() abort
  silent ! clear
  silent ! doctoc --notitle %
  redraw!
endfunction
command! TOC :call GenTOC()

" trim trailing whitespace
" https://www.vi-improved.org/recommendations/
function! TrimTrailingWhitespace() abort
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
command! TrimTrailingWhitespace :call TrimTrailingWhitespace()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" vim-signify
""""""""""""""""""""""""""""""""""""""""

let g:signify_sign_add = '┃'
let g:signify_sign_delete = '┃'
let g:signify_sign_delete_first_line = '┃'
let g:signify_sign_change = '┃'

nnoremap <silent> gs <cmd>SignifyHunkDiff<cr>

""""""""""""""""""""""""""""""""""""""""
" vim-fugitive
""""""""""""""""""""""""""""""""""""""""
let g:fugitive_gitlab_domains = ['https://gitlab.zeta.tools']

""""""""""""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""""""""""""
let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled = 0
let g:go_doc_keywordprg_enabled = 0

""""""""""""""""""""""""""""""""""""""""
" vim-test
""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

