let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
      \ 'coc-syntax',
      \ 'coc-tsserver',
      \ 'coc-neosnippet',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ ]

inoremap <silent><expr> <c-space> coc#refresh()

" coc.preferences
call coc#config('coc.preferences', {
      \ "autoTrigger": "always",
      \ "codeLens.enable": 1,
      \ "diagnostic.virtualText": 1,
      \ "enableFloatHighlight": 1,
      \ "formatOnSaveFileTypes": [ "go", "json", "jsonc", "markdown", "python", "rust", "sh", "yaml", "terraform", "tf", "hcl" ],
      \ "formatOnType": 1,
      \ })

call coc#config('codeLens', {
      \ "enable": 1,
      \ })

call coc#config('suggest', {
      \ "floatEnable": 1,
      \ "noselect": 0,
      \ "defaultSortMethod": "alphabetical",
      \ })

call coc#config('git', {
      \ "addGBlameToVirtualText": 1,
      \ })
