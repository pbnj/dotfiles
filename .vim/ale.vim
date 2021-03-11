""""""""""""""""""""""""""""""""""""""""
" https://github.com/dense-analysis/aleale
""""""""""""""""""""""""""""""""""""""""

" install language servers for ale
if !executable('bash-language-server')
  exe '! npm install -g bash-language-server'
endif
if !executable('vim-language-server')
  exe '! npm install -g vim-language-server'
endif
if !executable('tsserver')
  exe '! npm install -g typescript'
endif

" install linters & fixers
if !executable('prettier')
  exe '! npm i -g prettier'
  exe '! npm i -g prettier-plugin-sh'
  exe '! npm i -g prettier-plugin-go-template'
  exe '! npm i -g @prettier/plugin-ruby'
  exe '! npm i -g prettier-plugin-java'
endif
if !executable('doctoc')
  exe '! npm i -g doctoc'
endif
if !executable('markdownlint')
  exe '! npm i -g markdownlint-cli'
endif

set omnifunc=ale#completion#OmniFunc
let g:ale_fixers = {
      \ '*'          : [ "remove_trailing_lines", "trim_whitespace" ] ,
      \ 'sh'         : [ "shfmt"                                    ] ,
      \ 'bash'       : [ "shfmt"                                    ] ,
      \ 'javascript' : [ "prettier"                                 ] ,
      \ 'typescript' : [ "prettier", "eslint"                       ] ,
      \ 'markdown'   : [ "prettier"                                 ] ,
      \ 'yaml'       : [ "prettier"                                 ] ,
      \ 'json'       : [ "prettier"                                 ] ,
      \ 'go'         : [ "goimports"                                ] ,
      \ 'rust'       : [ "rustfmt"                                  ] ,
      \ 'ruby'       : [ "rubocop"                                  ] ,
      \ 'graphql'    : [ "prettier"                                 ] ,
      \ 'hcl'        : [ "terraform"                                ] ,
      \ 'terraform'  : [ "terraform"                                ] ,
      \ 'html'       : [ "prettier"                                 ] ,
      \ }

nnoremap <silent> <leader>af <Cmd>ALEFix<CR>
nnoremap <silent> <leader>al <Cmd>ALELint<CR>
nnoremap <silent> gd <Cmd>ALEGoToDefinition<CR>
