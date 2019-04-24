call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'             , { 'for': 'toml' }
Plug 'ekalinin/Dockerfile.vim'      , { 'for': 'dockerfile' }
Plug 'elzr/vim-json'                , { 'for': 'json' }
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'                 , { 'for': 'go'           , 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'junegunn/fzf'                 , { 'dir': '~/.fzf'       , 'do': './install --all' }
Plug 'mzlogin/vim-markdown-toc'     , { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown'      , { 'for': 'markdown' }
Plug 'Quramy/vison'                 , { 'for': 'json' }
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'

call plug#end()

set inccommand=split
set list

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_json_syntax_conceal = 0

map j gj
map k gk
