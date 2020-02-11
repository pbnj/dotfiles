set nocompatible

" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" formatter
Plug 'sbdchd/neoformat'

" async make framework
Plug 'neomake/neomake'

" language Server
Plug 'neoclide/coc.nvim'      , {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-css',
      \ 'coc-emmet',
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
      \ 'coc-rls',
      \ 'coc-rust-analyzer',
      \ 'coc-syntax',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ ]

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" align
Plug 'junegunn/vim-easy-align'
" start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" status Bar
Plug 'vim-airline/vim-airline'

" change root dir
Plug 'airblade/vim-rooter'

" dev icons
Plug 'ryanoasis/vim-devicons'

" nerdtree
Plug 'preservim/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" git integration with file manager
Plug 'Xuyuanp/nerdtree-git-plugin'

" commenter
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1

" fast grep
Plug 'jremmen/vim-ripgrep'

" run jobs in background
Plug 'tpope/vim-dispatch'

" vim+git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" sensible settings
Plug 'tpope/vim-sensible'

" surround functionality
Plug 'tpope/vim-surround'

" additional square bracket functionalities
Plug 'tpope/vim-unimpaired'

" jsonc
Plug 'neoclide/jsonc.vim'

" hashicorp tools
Plug 'hashivim/vim-hashicorp-tools'

" highlight whitespace
Plug 'ntpeters/vim-better-whitespace'

" go
Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }
let g:go_def_mapping_enabled = 0 " disable `gd`
let g:go_doc_keywordprg_enabled = 0 " disable `K`
let g:go_gopls_enabled = 0 " disable `gopls`

" rust
Plug 'rust-lang/rust.vim'

" editorconfig
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" indent guides
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Options
"""""""""""""""""""""""""""""""""""""""""

if has('nvim')
  set inccommand=split
  tnoremap <Esc> <C-\><C-n>
endif

if has('gui_running')
  set guifont=SauceCodeProNerdFontComplete-Regular:h16
endif

set autoindent
set autoread
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
set incsearch
set infercase
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set nobackup
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
set updatetime=100
set wildignorecase
set wildmenu

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: COC
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
  autocmd BufNewFile,BufRead Justfile,justfile setfiletype make
  autocmd FileType vim,markdown,yaml,json,terraform,hcl,tf
        \ setlocal ts=2 |
        \ setlocal sw=2 |
        \ setlocal expandtab |
        \ setlocal smarttab
augroup END

""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Functions & Commands
""""""""""""""""""""""""""""""""""""""""

function! ToggleBackground(...) abort
  if has('macunix')
    let s:mode = systemlist("defaults read -g AppleInterfaceStyle")[0]

    if s:mode ==? "dark"
      let &background = "dark"
    else
      let &background = "light"
    endif

  endif
endfunction
call ToggleBackground()

function! GenerateTableOfContents() abort
  silent ! doctoc --notitle %
  " silent ! mdtoc --inplace %
  redraw!
endfunction
command! TOC :call GenerateTableOfContents()

function! Kubectl(...) abort
  echon system("kubectl" . " " . join(a:000))
endfunction
command! -nargs=* Kubectl call Kubectl(<f-args>)

function! Just(...) abort
  echon system("just" . " " . join(a:000))
endfunction
command! -nargs=* -complete=customlist,JustComplete Just call Just(<f-args>)

function! JustComplete(A, L, P) abort
  return filter(split(system("just --summary 2>/dev/null")), 'v:val =~ a:A')
endfunction
