" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" Easy Motions
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

" Formatters
Plug 'sbdchd/neoformat'

" Makers
Plug 'neomake/neomake'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-gocode',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
      \ 'coc-sql',
      \ 'coc-syntax',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]

" Test Runner
Plug 'janko/vim-test'
let test#strategy = "dispatch"

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Align
Plug 'godlygeek/tabular'

" Status Bar
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

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

syntax off
let g:syntax_on = 0

let g:netrw_liststyle = 3

highlight ColorColumn ctermbg=DarkGray ctermfg=White
highlight DiffAdd     ctermbg=NONE      ctermfg=Green
highlight DiffChange  ctermbg=NONE      ctermfg=Yellow
highlight DiffDelete  ctermbg=NONE      ctermfg=Red
highlight Pmenu       ctermbg=DarkBlue  ctermfg=White
highlight PmenuSel    ctermbg=White     ctermfg=DarkBlue
highlight Search      ctermbg=NONE      ctermfg=White      cterm=underline,bold
highlight SignColumn  ctermbg=NONE

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
"""""""""""""""""""""""""""""""""""""""""

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
set display=lastline
set encoding=utf-8
set fileencoding=utf-8
set formatoptions+=j " remove comment leader when joining lines
set formatoptions+=n " when formatting text, recognize numbered lists
set formatoptions+=r " auto insert bullet point on new lines
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
set noshowmode
set nospell
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set path+=**
set ruler
set scrolloff=1
set shortmess+=c
set showcmd
set showmatch
set signcolumn=yes
set smartcase
set smarttab
set splitbelow
set splitright
set t_ut=""
set textwidth=80
set undodir=$HOME/.vim/undo
set undofile
set updatetime=100
set wildignorecase
set wildmenu
set wildmode=longest,full

if has('nvim')
  set inccommand=split
  tnoremap <Esc> <C-\><C-n>
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
endif

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: General > Mappings
""""""""""""""""""""""""""""""""""""""""

" Arrows
nnoremap <silent> <left>  <esc>:lprev<cr>
nnoremap <silent> <right> <esc>:lnext<cr>
nnoremap <silent> <up>    <esc>:cprev<cr>
nnoremap <silent> <down>  <esc>:cnext<cr>

" Misc
nnoremap <Leader><space> :noh<CR>
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
  autocmd BufNewFile,BufRead [Jj]ustfile setfiletype make
  autocmd BufWritePre *.go
        \ :call CocAction('runCommand', 'editor.action.organizeImport')
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
" SETTINGS: Plugins > COC
""""""""""""""""""""""""""""""""""""""""

" Completions
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
" navigate chunks of current buffer
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

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
