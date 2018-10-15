" set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Languages
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries', 'for': 'go' }
Plug 'hashivim/vim-hashicorp-tools'
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }

call plug#end()

filetype plugin indent on
syntax enable

" general settings
set autowrite
set encoding=utf8
set foldmethod=syntax
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set mouse=a
set number
set number
set showcmd
set showmatch

let mapleader = ' '
nnoremap <SPACE> <Nop>

" keybindings
map <C-f> :NERDTreeToggle<CR>
nnoremap gV `[v`]
nnoremap j gj
nnoremap k gk

" airline
let g:airline#extensions#tabline#enabled  = 1

" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save                = 1
let g:ale_completion_enabled         = 1
let g:ale_sign_column_always         = 1
let g:ale_fixers                     = {
			\ '*': ['trim_whitespace', 'remove_trailing_lines'],
			\ 'javascript': ['prettier', 'eslint'],
			\ 'sh': ['shfmt'],
			\ 'yaml': ['prettier'],
			\}

" nerdcommenter
let g:NERDSpaceDelims = 1

" fugitive
nnoremap <leader>ga :Git add<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" vim-go
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

augroup go
	autocmd!
	autocmd FileType go
				\ setlocal ts=4 |
				\ setlocal sw=4 |
				\ setlocal noexpandtab
	autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
	autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
	autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)
	autocmd FileType go nmap <silent> <Leader>d <Plug>(go-doc-split)
	autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
	autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
	autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
	autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
	autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
	autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
	autocmd Filetype go command! -bang A  call go#alternate#Switch(<bang>0, 'edit')
	autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
	autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
	autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"let g:syntastic_go_checkers = ['go']
let g:go_fmt_command        = 'goimports'
let g:go_list_type          = 'quickfix'
let g:go_def_mode           = 'guru'
let g:go_info_mode          = 'guru'
let g:go_autodetect_gopath  = 1
"let g:go_auto_type_info   = 1
"set updatetime            = 100

" Enable Go syntax highlighting.
" If perf is significantly impacted, remove or disable highlighting below
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_types             = 1
let g:go_highlight_fields            = 1
let g:go_highlight_operators         = 1
let g:go_highlight_extra_types       = 1
let g:go_highlight_build_constraints = 1
