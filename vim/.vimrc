" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-signify'
Plug 'machakann/vim-highlightedyank'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wellle/targets.vim'
Plug 'tweekmonster/startuptime.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

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

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'
Plug 'Quramy/vison'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'editorconfig/editorconfig-vim'
Plug 'janko/vim-test'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'hashivim/vim-hashicorp-tools'

Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on
syntax on

set autoindent
set autoread
set background=dark
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
set listchars=tab:\|·,extends:≫,precedes:≪,nbsp:·,trail:·
set mouse=a
set nobackup
set nofoldenable
set nomodeline
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
set sidescrolloff=5
set signcolumn=yes
set smartcase
set smarttab
set splitbelow
set splitright
set t_ut
set tabline
set tags+=tags
set termguicolors
set textwidth=79
set ttyfast
set undodir=$HOME/.vim/undo
set undofile
set updatetime=100
set wildignorecase
set wildmenu
set wildmode=longest,full

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
" STATUSLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " file name
" set statusline=
" set statusline+=%{'\ '}
" set statusline+=%F
" set statusline+=%{'\ '}
" " spell
" set statusline+=%{'\ '}
" set statusline+=%{&spell?'[SPELL]':''}
" set statusline+=%{'\ '}
" " paste
" set statusline+=%#Warnings#
" set statusline+=%{'\ '}
" set statusline+=%{&paste?'[PASTE]':''}
" set statusline+=%{'\ '}
" set statusline+=%*
" " modified?
" set statusline+=%m
" " read only?
" set statusline+=%r
" " help?
" set statusline+=%h
" " preview?
" set statusline+=%w
" " truncate here
" set statusline+=%<
" " separate left/right aligned items
" set statusline+=%=
" " tabstop/softtabstop/shiftwidth/expandtab
" set statusline+=%{'\ '}
" set statusline+=[ts:%{&ts}/sts:%{&sts}/sw:%{&sw}/et:%{&et}]
" set statusline+=%{'\ '}
" " file format
" set statusline+=[%{&ff}]
" set statusline+=%{'\ '}
" " filetype
" set statusline+=%y
" set statusline+=%{'\ '}
" " current line & column
" set statusline+=[col:%03c]
" set statusline+=%{'\ '}
" " current line / total # lines (% into file)
" set statusline+=[line:%l/%L\ (%p%%)]
" set statusline+=%{'\ '}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_liststyle = 3
let g:netrw_winsize   = 25

let g:gruvbox_invert_selection=0
colorscheme gruvbox

" if &background == 'light'
"   let $FZF_DEFAULT_OPTS='--color=bw'
" else
"   let $FZF_DEFAULT_OPTS=''
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Getting around
nnoremap <Leader>b :b <C-d>
nnoremap <Leader>e :e **/
nnoremap <Leader>i :Ilist<space>
nnoremap <Leader>j :tjump /
nnoremap <Leader>m :make<cr>
nnoremap <Leader>q :b#<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>g :silent lgrep<Space>

nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprevious<CR>

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

let g:formatprg_for_filetype = {
      \ "css"        : "prettier --parser css",
      \ "go"         : "gofmt",
      \ "html"       : "prettier --parser html",
      \ "javascript" : "prettier",
      \ "json"       : "prettier --parser json",
      \ "markdown"   : "prettier --parser markdown",
      \ "sql"        : "sqlformat -k upper -r -",
      \ "yaml"       : "prettier --parser yaml",
      \ "terraform"  : "terraform fmt -",
      \ }

for [ft, fp] in items(g:formatprg_for_filetype)
  execute "autocmd FileType ".ft." let &l:formatprg=\"".fp."\" | setlocal formatexpr="
endfor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

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

