nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Getting around
nnoremap <Leader>b <cmd>b <C-d>
nnoremap <Leader>e <cmd>e **/
nnoremap <Leader>i <cmd>Ilist<space>
nnoremap <Leader>j <cmd>tjump /
nnoremap <Leader>m <cmd>make<cr>
nnoremap <Leader>q <cmd>b#<cr>
nnoremap <Leader>f <cmd>Files<cr>
nnoremap <Leader>F <cmd>GFiles?<cr>
nnoremap <Leader>g <cmd>Rg<cr>

nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprevious<CR>

" https://github.com/onivim/oni/issues/2342
tnoremap <s-space> <space>
