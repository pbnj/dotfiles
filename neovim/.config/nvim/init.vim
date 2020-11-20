set nocompatible " this is redundant, but I prefer explicit settings over implicit/default behavior

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" startup time debugger
Plug 'tweekmonster/startuptime.vim'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" tab completion
" Plug 'ajh17/VimCompletesMe'

" test Runner
Plug 'janko/vim-test'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" alignment
Plug 'godlygeek/tabular'

" text objects
Plug 'wellle/targets.vim'

" tpope
Plug 'tpope/vim-dadbod'
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

" hashicorp tools
Plug 'hashivim/vim-hashicorp-tools'

" tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" lsp
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'kristijanhusak/completion-tags'

" languages
Plug 'chrisbra/csv.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'tsandall/vim-rego'
Plug 'towolf/vim-helm'
Plug 'ekalinin/Dockerfile.vim'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'elzr/vim-json'
Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }

" colorscheme
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'

call plug#end()

filetype on        " enable filetype detection
filetype indent on " enable filetype-specific indenting
filetype plugin on " enable filetype-specific plugins

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

set background=dark
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""
" FILE EXPLORER
""""""""""""""""""""""""""""""""""""""""

" netrw
let g:loaded_netrwPlugin = 1 " disable netrw
let g:netrw_liststyle = 3
let g:netrw_winsize   = 25

""""""""""""""""""""""""""""""""""""""""
" STATUSLINE
""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename' ],
      \             [ 'readonly', 'modified' ],
      \           ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'filetype', 'fileformat', 'fileencoding' ],
      \            ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \ },
      \ }

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
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
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

" on 'gf', create new files if they don't exist
map gf :e <cfile><cr>

" misc
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" mappings to custom functions. see functions & commands
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>r :Rg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS & COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" vim-fugitive
""""""""""""""""""""""""""""""""""""""""
let g:fugitive_gitlab_domains = ['https://gitlab.zeta.tools']

""""""""""""""""""""""""""""""""""""""""
" vim-json
""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""""""""""""
let g:go_def_mapping_enabled    = 0
let g:go_gopls_enabled          = 0
let g:go_doc_keywordprg_enabled = 0

""""""""""""""""""""""""""""""""""""""""
" vim-test
""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

""""""""""""""""""""""""""""""""""""""""
" lsp
""""""""""""""""""""""""""""""""""""""""
" source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/lsp.vim
