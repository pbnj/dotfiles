set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-rooter'

Plug 'preservim/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'neoclide/jsonc.vim'

" Misc
Plug 'ntpeters/vim-better-whitespace'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
"""""""""""""""""""""""""""""""""""""""""

colorscheme PaperColor

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set belloff=all
set breakindent
set cmdheight=2
set colorcolumn=80
set completeopt=longest,menuone,preview
set conceallevel=0
set cursorline
set display=lastline
set encoding=utf-8
set fileencoding=utf-8
set formatoptions+=j " remove comment leader when joining lines
set formatoptions+=n " when formatting text, recognize numbered lists
set formatoptions+=r " auto insert bullet point on new lines
set hidden
set hlsearch
set ignorecase
set inccommand=split
set incsearch
set infercase
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:\|\ ,
set nobackup
set nomodeline
set nonumber
set nospell
set noswapfile
set novisualbell
set nowritebackup
set number
set path+=**
set ruler
set scrolloff=1
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
set textwidth=80
set undodir=$HOME/.vim/undo
set undofile
set updatetime=250
set wildignorecase
set wildmenu
set wrap

let mapleader="\<SPACE>"

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: ALE
""""""""""""""""""""""""""""""""""""""""

let g:ale_fixers = {
      \ '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
      \ 'bash': [ 'shfmt' ],
      \ 'go': [ 'goimports' ],
      \ 'json': [ 'prettier' ],
      \ 'markdown': [ 'prettier' ],
      \ 'sh': [ 'shfmt' ],
      \ 'yaml': [ 'prettier' ],
      \ }

let g:ale_fix_on_save = 1

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: COC
""""""""""""""""""""""""""""""""""""""""

" Completions
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: General
""""""""""""""""""""""""""""""""""""""""

" Arrows
nmap <silent> <left> <esc>:lprev<cr>
nmap <silent> <right> <esc>:lnext<cr>
nmap <silent> <up> <esc>:cprev<cr>
nmap <silent> <down> <esc>:cnext<cr>

" Misc
nnoremap <Leader><space> :noh<CR>

" Getting around
nnoremap <Leader>b :b <C-d>
nnoremap <Leader>e :e **/
nnoremap <Leader>i :Ilist<space>
nnoremap <Leader>j :tjump /
nnoremap <Leader>m :make<cr>
nnoremap <Leader>q :b#<cr>
nnoremap <Leader>t :TTags<space>*<space>*<space>.<cr>

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: FileTypes
""""""""""""""""""""""""""""""""""""""""

augroup general
  autocmd!

  " General
  autocmd InsertEnter,InsertLeave * set cul!

  " vim
  autocmd FileType vim setlocal ts=2 sw=2 expandtab smarttab

  " markdown
  autocmd FileType markdown setlocal ts=2 sw=2 expandtab smarttab

  " yaml
  autocmd FileType yaml setlocal ts=2 sw=2 expandtab smarttab

  " json
  autocmd FileType json setlocal ts=2 sw=2 expandtab smarttab
  autocmd FileType json syntax match Comment +\/\/.\+$+

augroup END

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Functions & Commands
""""""""""""""""""""""""""""""""""""""""

function! GenerateTableOfContents()
  silent ! mdtoc --inplace %
  redraw!
endfunction
command! TOC :call GenerateTableOfContents()
