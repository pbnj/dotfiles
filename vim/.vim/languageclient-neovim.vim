"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Plugins > LanguageClient-neovim.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:LanguageClient_serverCommands = {
      \ 'go': ['gopls'],
      \ 'rust': ['rust-analyzer'],
      \ 'Dockerfile': ['docker-langserver', '--stdio'],
      \ 'sh': ['bash-language-server', 'start'],
      \ 'yaml': ['yaml-language-server', '--stdio'],
      \ }
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

nnoremap <silent>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent>gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent>gy :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <silent>go :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent>K :call LanguageClient#textDocument_hover()<CR>
