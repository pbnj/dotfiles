""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > vim-test
""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>TF :TestFile<CR>
nnoremap <leader>TL :TestLast<CR>
nnoremap <leader>TN :TestNearest<CR>
nnoremap <leader>TS :TestSuite<CR>
nnoremap <leader>TV :TestVisit<CR>
let test#strategy = "dispatch"
