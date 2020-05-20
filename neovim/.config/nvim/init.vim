set nocompatible

call plug#begin('~/.vim/plugged')

" linter, formatter, fixer, & LSP
let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'

" faster git gutter
Plug 'mhinz/vim-signify'

" test Runner
Plug 'janko/vim-test'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Align
Plug 'godlygeek/tabular'

" Change root dir
Plug 'airblade/vim-rooter'

" Commenter
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1

" Tpope
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Hashicorp Tools
Plug 'hashivim/vim-hashicorp-tools'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'neoclide/jsonc.vim'
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'tsandall/vim-rego'
Plug 'towolf/vim-helm'
Plug 'ekalinin/Dockerfile.vim'

Plug 'plasticboy/vim-markdown'

Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }

" colorschemes
Plug 'flazz/vim-colorschemes'

call plug#end()

filetype on        " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Appearance
"""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner = 0 " Disable netrw banner

" neovim specific settings
if has('nvim')
  set inccommand=split
  set termguicolors

  highlight Visual guibg=Gray20
  highlight CursorLine guibg=Gray20
endif

" set some options based on vim environment (e.g. tui, gui)
if has("gui_running")
  if has("gui_gtk")
    set guifont=JetBrainsMono\ Nerd\ Font\ 11
  elseif has("gui_macvim")
    set guifont=JetBrainsMono\ Nerd\ Font:h11
  elseif has("gui_win32")
    set guifont=JetBrainsMono\ Nerd\ Font:h11:cANSI
  endif
endif

highlight SignColumn ctermbg=NONE guibg=NONE
highlight DiffAdd cterm=NONE ctermfg=Green ctermbg=Green gui=NONE guifg=Green guibg=NONE
highlight DiffChange cterm=NONE ctermfg=Yellow ctermbg=Yellow gui=NONE guifg=Yellow guibg=NONE
highlight DiffDelete cterm=NONE ctermfg=Red ctermbg=Red gui=NONE guifg=Red guibg=NONE

set background=dark
" colorscheme nofrils-dark

" Statusline

set statusline=
set statusline+=%F                                                    " full path to file in the buffer
set statusline+=%m                                                    " rodified flag in square brackets
set statusline+=%r                                                    " readonly flag in square brackets
set statusline+=%h                                                    " help flag in square brackets
set statusline+=%w                                                    " preview flag in square brackets
set statusline+=\ [%L]                                                " number of lines
set statusline+=[%{&ff}]                                              " current fileformat
set statusline+=%y                                                    " current syntax
set statusline+=[%p%%]                                                " current % into file
set statusline+=[%04l,%04v]                                           " current line & current column
set statusline+=\ %{FugitiveStatusline()}                             " git branch
" set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')} " coc status

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
"""""""""""""""""""""""""""""""""""""""""

set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set breakindent
set cmdheight=2
set colorcolumn=+1
set completeopt=preview,menu,noinsert,noselect
set conceallevel=0
set cursorline
set display=lastline
set encoding=utf-8
set fileencoding=utf-8
set formatoptions+=j                                      "  remove comment leader when joining lines
set formatoptions+=n                                      "  when formatting text, recognize numbered lists
set hidden
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
set nofoldenable
set nomodeline
set norelativenumber
set nospell
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set number
set omnifunc=ale#completion#OmniFunc
set path+=**
set pumheight=10
set ruler
set shortmess+=c
set showcmd
set showmatch
set showmode
set signcolumn=yes
set smartcase
set smarttab
" set splitbelow
" set splitright
set t_ut=""
set tags+=tags
set textwidth=79
set ttyfast
set undodir=$HOME/.vim/undo
set undofile
set updatetime=100
set wildignorecase
set wildmenu
set wildmode=longest:full,full

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: General > Mappings
""""""""""""""""""""""""""""""""""""""""

" Misc
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
nnoremap <Leader>t :TTags<space>*<space>*<space>.<cr>

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: General > FileTypes
""""""""""""""""""""""""""""""""""""""""

augroup general
  autocmd!
  autocmd FileType vim,markdown,json,terraform,hcl,tf,ruby
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2  |
        \ setlocal expandtab
augroup END

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: General > Functions/Commands
""""""""""""""""""""""""""""""""""""""""

function! GenTOC() abort
  " npm i -g doctoc
  silent ! doctoc --notitle %
  silent ! prettier --write %
  redraw!
endfunction
command! TOC :call GenTOC()

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > vim-go
""""""""""""""""""""""""""""""""""""""""
let g:go_version_warning = 0
let g:go_def_mapping_enabled = 0    " disable `gd`
let g:go_doc_keywordprg_enabled = 0 " disable `K`
let g:go_gopls_enabled = 0          " disable `gopls`

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > vim-markdown
""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_frontmatter = 1

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > vim-test
""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>TF :TestFile<CR>
nnoremap <leader>TL :TestLast<CR>
nnoremap <leader>TN :TestNearest<CR>
nnoremap <leader>TS :TestSuite<CR>
nnoremap <leader>TV :TestVisit<CR>
let test#strategy = "dispatch"

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > ALE
""""""""""""""""""""""""""""""""""""""""

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'markdown': ['prettier'],
      \ 'css': ['prettier'],
      \ 'html': ['prettier'],
      \ 'yaml': ['prettier'],
      \ 'json': ['prettier'],
      \ 'go': ['goimports'],
      \ 'rego': ['opa'],
      \ 'sh': ['shfmt'],
      \ }
let g:ale_linters = {
      \ 'go': ['gopls'],
      \ 'sh': ['shellcheck'],
      \ }
