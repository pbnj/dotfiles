if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo "Downloading https://github.com/junegunn/vim-plug ..."
  silent ! curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" LSP
" list of language servers: https://microsoft.github.io/language-server-protocol/implementors/servers/
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-marketplace',
      \ 'coc-pairs',
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
let g:go_version_warning = 0
let g:go_def_mapping_enabled = 0    " disable `gd`
let g:go_doc_keywordprg_enabled = 0 " disable `K`
let g:go_gopls_enabled = 0          " disable `gopls`

call plug#end()

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

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
set pumheight=10
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
set ttyfast
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
set statusline+=\ %{coc#status()}

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
" SETTINGS: Plugins > COC
""""""""""""""""""""""""""""""""""""""""

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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" navigate git chunks
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo) " show chunk diff at current position
nmap gc <Plug>(coc-git-commit)    " show commit contains current position

" Remap keys for GOTOs
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

augroup coc
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction) " Remap for do codeAction of current line
nmap <leader>qf  <Plug>(coc-fix-current) " Fix autofix problem of current line

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
nnoremap <silent> <space>g  :<C-u>CocList diagnostics<cr> " Show all diagnostics
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>  " Manage extensions
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>    " Show commands
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>     " Find symbol of current document
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>  " Search workspace symbols
nnoremap <silent> <space>j  :<C-u>CocNext<CR>             " Do default action for next item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>             " Do default action for previous item.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>       " Resume latest coc list

