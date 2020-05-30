"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:signify_sign_add               = '▌'
let g:signify_sign_delete            = '▌'
let g:signify_sign_delete_first_line = '▌'
let g:signify_sign_change            = '▌'

nnoremap <silent>gS :SignifyDiff<cr>
nnoremap <silent>gs :SignifyHunkDiff<cr>
