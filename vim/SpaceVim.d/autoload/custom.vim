function! custom#after() abort
  call SpaceVim#logger#info('custom#after called')
  set guicursor+=a:blinkon0 " disable blinking cursor
  let g:NERDTreeWinPos = "left"
endfunction
