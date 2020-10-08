set nocompatible " this is redundant, but I prefer explicit settings over implicit/default behavior

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" startup time debugger
Plug 'tweekmonster/startuptime.vim'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" tab completion
Plug 'ajh17/VimCompletesMe'

" test Runner
Plug 'janko/vim-test'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" alignment
Plug 'godlygeek/tabular'
Plug 'tommcdo/vim-lion'

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

" " tags
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/tlib_vim'
" Plug 'tomtom/ttags_vim'
" Plug 'majutsushi/tagbar'

" romainl
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'

" languages
" linters
" let g:ale_completion_enabled=1
" Plug 'dense-analysis/ale'
" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'neoclide/jsonc.vim'
Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
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

""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""

function! MyHL() abort
  highlight Signcolumn NONE
  highlight DiffAdd
        \ cterm=NONE ctermbg=NONE
        \ gui=NONE guibg=NONE
  highlight DiffChange
        \ cterm=NONE ctermbg=NONE
        \ gui=NONE guibg=NONE
  highlight DiffDelete
        \ cterm=NONE ctermbg=NONE
        \ gui=NONE guibg=NONE
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHL()
  autocmd InsertEnter * setlocal cursorline
  autocmd InsertLeave * setlocal nocursorline
augroup END

set background=dark
let g:gruvbox_invert_selection = 0

colorscheme gruvbox

" disable fzf colors on light background
if &background ==# 'light'
  let $FZF_DEFAULT_OPTS="--color=bw"
else
  let $FZF_DEFAULT_OPTS=""
endif

""""""""""""""""""""""""""""""""""""""""
" FONTS
""""""""""""""""""""""""""""""""""""""""

" set font for vim GUIs
if has("gui_running")
  if has("gui_gtk")
    set guifont=JetBrainsMono\ Nerd\ Font\ 11
  elseif has("gui_macvim")
    set guifont=JetBrainsMono\ Nerd\ Font:h11
  elseif has("gui_win32")
    set guifont=JetBrainsMono\ Nerd\ Font:h11:cANSI
  endif
endif

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
      \   'left': [ [ 'mode', 'paste'         ],
      \             [ 'gitbranch', 'filename' ],
      \             [ 'readonly', 'modified' ],
      \           ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'filetype', 'fileformat', 'fileencoding'  ],
      \              [ 'gitblame' ],
      \            ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \   'gitblame': 'CocGitBlame',
      \ },
      \ }

function! CocGitBlame() abort
  return get(b:, 'coc_git_blame', '')
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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
" FILETYPES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup mans
  autocmd!
  autocmd FileType yaml.docker-compose
        \ setlocal keywordprg=~/.vim/mans/docker-compose
  autocmd FileType Dockerfile
        \ setlocal keywordprg=~/.vim/mans/docker
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" create new files if they don't exist on 'gf'
map gf :e <cfile><cr>

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

" mappings to custom functions. see functions & commands
nnoremap <leader>t :TOC<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>r :Rg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS & COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" markdown TOC
" npm i -g doctoc
function! GenTOC() abort
  silent ! clear
  silent ! doctoc --title '\#\# Table of Contents' %
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
" coc.nvim
""""""""""""""""""""""""""""""""""""""""
" register language servers
" https://microsoft.github.io/language-server-protocol/implementors/servers/
" https://github.com/iamcco/vim-language-server
" https://github.com/bash-lsp/bash-language-server
" https://github.com/redhat-developer/yaml-language-server
" https://github.com/rcjsuen/dockerfile-language-server-nodejs
" https://solargraph.org/guides/getting-started
let g:coc_global_extensions = [
      \ 'coc-docker',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-git',
      \ 'coc-go',
      \ 'coc-highlight',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-marketplace',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
      \ 'coc-snippets',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-syntax',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" Tab to trigger completions, snippet expansion and jumps (like VSCode)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  " vim handles <c-space> differently
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" git integrations
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)
" nmap gc <Plug>(coc-git-commit)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
nnoremap <silent> <space>g  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocCommand explorer<cr>
nnoremap <silent> <space>m  :<C-u>CocList marketplace<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
