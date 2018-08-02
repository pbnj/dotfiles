function! custom#before() abort
  let g:ale_fix_on_save = 1
  let g:ale_fixers      = {
    \ "*": ['trim_whitespace', 'remove_trailing_lines'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'sh': ['shfmt'],
    \ 'yaml': ['prettier'],
    \}
endfunction

function! custom#after() abort
  call SpaceVim#logger#info('custom#after called')
  set guicursor+=a:blinkon0 " disable blinking cursor
  let g:NERDTreeWinPos = "left"
endfunction
