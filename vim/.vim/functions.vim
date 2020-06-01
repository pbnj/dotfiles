"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS: General > Functions & Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! GenTOC() abort
  " npm i -g doctoc
  silent ! doctoc --notitle %
  silent ! prettier --write %
  redraw!
endfunction
command! TOC :call GenTOC()

function! StripTrailingWhitespace() abort
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
command! StripTrailingWhitespace :call StripTrailingWhitespace()
