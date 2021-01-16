" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" misc
Plug 'https://github.com/airblade/vim-rooter'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/wellle/targets.vim'
Plug 'https://github.com/tweekmonster/startuptime.vim'
Plug 'https://github.com/tmux-plugins/vim-tmux-focus-events'
Plug 'https://github.com/christoomey/vim-tmux-navigator'

" tpope
Plug 'https://github.com/tpope/vim-dadbod' | Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-fugitive' | Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'https://github.com/tpope/vim-jdaddy'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/tpope/vim-sleuth'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/tpope/vim-characterize'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-projectionist'

" languages
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'https://github.com/tpope/vim-rails'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/Quramy/vison'
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/janko/vim-test'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/hashivim/vim-hashicorp-tools'
Plug 'https://github.com/jparise/vim-graphql'
Plug 'https://github.com/habamax/vim-asciidoctor'
Plug 'https://github.com/towolf/vim-helm'

" aesthetics
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" challenger deep theme
Plug 'https://github.com/challenger-deep-theme/vim', { 'as': 'challenger-deep-vim' }
Plug 'https://github.com/challenger-deep-theme/iterm', { 'as': 'challenger-deep-iterm', 'do': 'open challenger-deep.itermcolors' }

call plug#end()

filetype plugin indent on

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
set cursorline
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
set listchars=tab:\|\ ,extends:≫,precedes:≪,nbsp:·,trail:·
set modeline
set mouse=a
set nobackup
set nofoldenable
set norelativenumber
set noshowcmd
set noshowmode
set noswapfile
set nowrap
set nowrapscan " stop searching at end of file. do not restart search from top
set nowritebackup
set number
set path=.,**
set pumheight=10
set ruler
set scrolloff=1
set secure
set shortmess+=c
set showmatch
set showtabline=2
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
set wildmode=longest:full,full

if has("gui_running")
  set guifont=JetBrainsMono\ Nerd\ Font
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_liststyle = 3
let g:netrw_winsize   = 25

syntax on

set background=dark

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme challenger_deep
" colorscheme nord

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Getting around
nnoremap <Leader>b <cmd>b <C-d>
nnoremap <Leader>e <cmd>e **/
nnoremap <Leader>i <cmd>Ilist<space>
nnoremap <Leader>j <cmd>tjump /
nnoremap <Leader>m <cmd>make<cr>
nnoremap <Leader>q <cmd>b#<cr>
nnoremap <Leader>f <cmd>Files<cr>
nnoremap <Leader>g <cmd>Rg<cr>

nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" generate table of contents for markdown
function! GenTableOfContents() abort
  if &filetype == 'markdown'
    execute "Spawn npx doctoc --notitle %" | edit
  endif
endfunction
command! TOC :call GenTableOfContents()

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

""""""""""""""""""""""""""""""""""""""""
" CONFIGURATION FILE GENERATORS
""""""""""""""""""""""""""""""""""""""""

" commitlint
function! GenCommitLintRC() abort
  if filereadable(expand("~/.dotfiles/templates/.commitlintrc.yml"))
    execute "Spawn! cp "
          \ . expand("~/.dotfiles/templates/.commitlintrc.yml")
          \ . " "
          \ . expand("%:h")
  endif
endfunction

" yamllint
function! GenYAMLLint() abort
  if filereadable(expand("~/.dotfiles/templates/.yamllint.yaml"))
    execute "Spawn! cp "
          \ . expand("~/.dotfiles/templates/.yamllint.yaml")
          \ . " "
          \ . expand("%:h")
  endif
endfunction

" markdownlint
function! GenMarkdownLint() abort
  if filereadable(expand("~/.dotfiles/templates/.markdownlint.yaml"))
    execute "Spawn! cp "
          \ . expand("~/.dotfiles/templates/.markdownlint.yaml")
          \ . " "
          \ . expand("%:h")
  endif
endfunction

" prettier
function! GenPrettierRC() abort
  if filereadable(expand("~/.dotfiles/templates/.prettierrc.yaml"))
    execute "Spawn! cp "
          \ . expand("~/.dotfiles/templates/.prettierrc.yaml")
          \ . " "
          \ . expand("%:h")
  endif
endfunction

" semantic-release
function! GenReleaseRC() abort
  if filereadable(expand("~/.dotfiles/templates/.releaserc.yaml"))
    execute "Spawn! cp "
          \ . expand("~/.dotfiles/templates/.releaserc.yaml")
          \ . " "
          \ . expand("%:h")
  endif
endfunction

" editorconfig
function! GenEditorConfig() abort
  if filereadable(expand("~/.dotfiles/templates/.editorconfig"))
    execute "Spawn! cp "
          \ . expand("~/.dotfiles/templates/.editorconfig")
          \ . " "
          \ . expand("%:h")
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" install built-in `matchit` plugin.
" :h matchit-install
packadd! matchit

""""""""""""""""""""""""""""""""""""""""
" vim-signify
""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
  let g:signify_sign_add = '┃'
  let g:signify_sign_delete = '┃'
  let g:signify_sign_delete_first_line = '┃'
  let g:signify_sign_change = '┃'
endif

nnoremap <silent> gs <cmd>SignifyHunkDiff<cr>

""""""""""""""""""""""""""""""""""""""""
" vim-fugitive
""""""""""""""""""""""""""""""""""""""""
let g:fugitive_gitlab_domains = ['https://gitlab.zeta.tools']

""""""""""""""""""""""""""""""""""""""""
" vim-test
""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>

""""""""""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""""""""""

let g:ale_fixers = {
      \ '*': [ "remove_trailing_lines", "trim_whitespace" ],
      \ 'sh': ["shfmt"],
      \ 'bash': ["shfmt"],
      \ 'javascript': ["prettier"],
      \ 'typescript': ["prettier"],
      \ 'markdown': ["prettier"],
      \ 'yaml': ["prettier"],
      \ 'json': ["prettier"],
      \ 'go': ["goimports"],
      \ 'rust': ["rustfmt"],
      \ 'ruby': ["rubocop"],
      \ 'graphql': ["prettier"],
      \ 'hcl': ["terraform"],
      \ 'terraform': ["terraform"],
      \ 'html': ["prettier"],
      \ }
