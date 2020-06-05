"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > neoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:neoformat_basic_format_trim  = 1
let g:neoformat_try_formatprg      = 1
let g:neoformat_run_all_formatters = 1

" doctoc
let g:neoformat_markdown_doctoc  = {
      \ 'exe': 'doctoc',
      \ 'args': ['--no-title'],
      \ 'replace': 1,
      \ }
let g:neoformat_enabled_markdown = ['doctoc', 'prettier']

" opa
let g:neoformat_rego_opa     = {
      \ 'exe': 'opa',
      \ 'args': ['fmt'],
      \ 'stdin': 1,
      \ }
let g:neoformat_enabled_rego = ['opa']
