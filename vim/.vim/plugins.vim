" install built-in `matchit` plugin.
" :h matchit-install
packadd! matchit

""""""""""""""""""""""""""""""""""""""""
" open-browser
""""""""""""""""""""""""""""""""""""""""
" disable netrw's gx mapping.
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

""""""""""""""""""""""""""""""""""""""""
" vim-signify
""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> gs <cmd>SignifyHunkDiff<cr>

""""""""""""""""""""""""""""""""""""""""
" vim-fugitive
""""""""""""""""""""""""""""""""""""""""
let g:fugitive_gitlab_domains = ['https://gitlab.zeta.tools']

""""""""""""""""""""""""""""""""""""""""
" vim-test
""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>

""""""""""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""""""""""

let g:ale_fixers = {
      \ '*': [ "remove_trailing_lines", "trim_whitespace" ],
      \ 'sh': ["shfmt"],
      \ 'bash': ["shfmt"],
      \ 'javascript': ["prettier"],
      \ 'typescript': ["prettier"],
      \ 'markdown': ["prettier"],
      \ 'yaml': ["prettier"],
      \ 'json': ["prettier"],
      \ 'go': ["goimports"],
      \ 'rust': ["rustfmt"],
      \ 'ruby': ["rubocop"],
      \ 'graphql': ["prettier"],
      \ 'hcl': ["terraform"],
      \ 'terraform': ["terraform"],
      \ 'html': ["prettier"],
      \ }
