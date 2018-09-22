function! custom#before() abort

  let g:spacevim_custom_plugins = [
        \ ['hashivim/vim-hashicorp-tools'],
        \ ]

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

  let g:airline_left_sep=''
  let g:airline_right_sep=''

  set guicursor+=a:blinkon0 " disable blinking cursor
  set wrap

  nnoremap j gj
  nnoremap k gk

  let g:NERDTreeWinPos = "left"

endfunction
