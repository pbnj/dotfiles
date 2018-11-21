function! custom#before() abort
  call SpaceVim#logger#info('custom#before called')

  let g:terraform_fmt_on_save=1

  let g:ale_fix_on_save = 1
  let g:ale_fixers      = {
    \ '*': ['trim_whitespace', 'remove_trailing_lines'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'markdown': ['prettier'],
    \ 'json': ['jq'],
    \ 'sh': ['shfmt'],
    \}

endfunction

function! custom#after() abort
  call SpaceVim#logger#info('custom#after called')

  set foldmethod=syntax
  set signcolumn=yes
  set wrap

  nnoremap j gj
  nnoremap k gk

  let g:NERDTreeWinPos = 'left'

endfunction
