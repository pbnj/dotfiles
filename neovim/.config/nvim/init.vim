if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo "Downloading https://github.com/junegunn/vim-plug ..."
  silent ! curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" LSP
" list of language servers: https://microsoft.github.io/language-server-protocol/implementors/servers/
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rust-analyzer'],
      \ 'go': ['gopls'],
      \ 'dockerfile': ['docker-langserver', '--stdio'],
      \ 'Dockerfile': ['docker-langserver', '--stdio'],
      \ 'sh': ['bash-language-server', 'start'],
      \ 'yaml': ['yaml-language-server', '--stdio'],
      \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" completions
Plug 'lifepillar/vim-mucomplete'
let g:mucomplete#enable_auto_at_startup = 1

" Formatters
Plug 'sbdchd/neoformat'

" Makers
Plug 'neomake/neomake'

" Tag bar
Plug 'majutsushi/tagbar'
nnoremap <leader>B :TagbarToggle<CR>

" Test Runner
Plug 'janko/vim-test'
nnoremap <leader>TF :TestFile<CR>
nnoremap <leader>TL :TestLast<CR>
nnoremap <leader>TN :TestNearest<CR>
nnoremap <leader>TS :TestSuite<CR>
nnoremap <leader>TV :TestVisit<CR>
let test#strategy = "dispatch"

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

" highlight yank
Plug 'machakann/vim-highlightedyank'

" gitgutter
Plug 'mhinz/vim-signify'
nnoremap <leader>gd :SignifyDiff<cr>
nnoremap <leader>gs :SignifyHunkDiff<cr>
nnoremap <leader>gu :SignifyHunkUndo<cr>

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
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_frontmatter = 1

Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }
let g:go_def_mapping_enabled = 0    " disable `gd`
let g:go_doc_keywordprg_enabled = 0 " disable `K`
let g:go_gopls_enabled = 0          " disable `gopls`

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Appearance
"""""""""""""""""""""""""""""""""""""""""

set background=dark
syntax off
let g:syntax_on = 0

highlight SignColumn ctermbg=NONE                           guibg=NONE
highlight DiffAdd    ctermbg=NONE       ctermfg=DarkGreen   guibg=NONE guifg=Green
highlight DiffChange ctermbg=NONE       ctermfg=DarkYellow  guibg=NONE guifg=Yellow
highlight DiffDelete ctermbg=NONE       ctermfg=DarkRed     guibg=NONE guifg=Red
highlight Pmenu      ctermbg=LightGray  ctermfg=Black       guibg=LightGray guifg=Black
highlight PmenuSel   ctermbg=Blue       ctermfg=White       guibg=Blue guifg=White

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
"""""""""""""""""""""""""""""""""""""""""

set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set breakindent
set cmdheight=2
set colorcolumn=80
set completeopt=preview,menu,noinsert,noselect
set conceallevel=0
set display=lastline
set encoding=utf-8
set fileencoding=utf-8
set formatoptions+=j                                      "  remove comment leader when joining lines
set formatoptions+=n                                      "  when formatting text, recognize numbered lists
set formatoptions+=r                                      "  auto insert bullet point on new lines
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
set nocursorline
set nofoldenable
set nomodeline
set nonumber
set norelativenumber
set nospell
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set path+=**
set ruler
set shortmess+=c
set showcmd
set showmatch
set showmode
set signcolumn=yes
set smartcase
set smarttab
set splitbelow
set splitright
set t_ut=""
set tags+=tags
set textwidth=80
set undodir=$HOME/.vim/undo
set undofile
set updatetime=100
set wildignorecase
set wildmenu
set wildmode=longest:full

" statusline
set statusline=
set statusline+=%F          " full path to file in the buffer
set statusline+=%m          " rodified flag in square brackets
set statusline+=%r          " readonly flag in square brackets
set statusline+=%h          " help flag in square brackets
set statusline+=%w          " preview flag in square brackets
set statusline+=\ [%L]        " number of lines
set statusline+=[%{&ff}]    " current fileformat
set statusline+=%y          " current syntax
set statusline+=[%p%%]      " current % into file
set statusline+=[%04l,%04v] " current line & current column

if has('nvim')
  set inccommand=split
  tnoremap <Esc> <C-\><C-n>
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: General > Mappings
""""""""""""""""""""""""""""""""""""""""

" Arrows
nnoremap <silent> <C-h> <esc>:lprev<cr>
nnoremap <silent> <C-l> <esc>:lnext<cr>
nnoremap <silent> <C-k> <esc>:cprev<cr>
nnoremap <silent> <C-j> <esc>:cnext<cr>

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

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Test Runner
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: General > FileTypes
""""""""""""""""""""""""""""""""""""""""

augroup general
  autocmd!
  autocmd FileType vim,markdown,json,terraform,hcl,tf
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
" SETTINGS: Plugins > Formatters
""""""""""""""""""""""""""""""""""""""""

let g:neoformat_try_formatprg      = 1
let g:neoformat_run_all_formatters = 1

let g:neoformat_markdown_doctoc  = {
      \ 'exe': 'doctoc',
      \ 'args': ['--no-title'],
      \ 'replace': 1,
      \ }
let g:neoformat_enabled_markdown = ['doctoc', 'prettier']

let g:neoformat_rego_opa     = {
      \ 'exe': 'opa',
      \ 'args': ['fmt'],
      \ 'stdin': 1,
      \ }
let g:neoformat_enabled_rego = ['opa']

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > LanguageClient-neovim
""""""""""""""""""""""""""""""""""""""""

