function! custom#before() abort
  call SpaceVim#logger#info('custom#before called')

  set foldmethod=syntax
  let g:terraform_fmt_on_save=1

  let g:ale_fix_on_save = 1
  let g:ale_fixers      = {
    \ "*": ['trim_whitespace', 'remove_trailing_lines'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'markdown': ['prettier'],
    \ 'json': ['prettier'],
    \ 'sh': ['shfmt'],
    \ 'yaml': ['prettier'],
    \}

endfunction

function! custom#after() abort
  call SpaceVim#logger#info('custom#after called')

  set wrap

  nnoremap j gj
  nnoremap k gk

  let g:NERDTreeWinPos = "left"

endfunction
