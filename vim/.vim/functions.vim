" generate table of contents for markdown
function! GenTableOfContents() abort
  if &filetype == 'markdown'
    execute "Spawn npx doctoc --notitle %" | edit
  endif
endfunction
command! TOC :call GenTableOfContents()

" trim trailing whitespace
" https://www.vi-improved.org/recommendations/
function! TrimTrailingWhitespace() abort
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
command! TrimTrailingWhitespace :call TrimTrailingWhitespace()

""""""""""""""""""""""""""""""""""""""""
" CONFIGURATION FILE GENERATORS
""""""""""""""""""""""""""""""""""""""""
" helper function
function! s:copy_config(config)
  if filereadable(expand(a:config))
    execute printf('!cp %s %s', a:config, FindRootDirectory())
  else
    echohl Error
    echomsg printf('config file not found: %s', a:config)
    echohl None
  endif
endfunction

" commitlint
function! GenCommitLintRC() abort
  call s:copy_config('~/.dotfiles/templates/.commitlintrc.yml')
endfunction

" yamllint
function! GenYAMLLint() abort
  call s:copy_config('~/.dotfiles/templates/.yamllint.yaml')
endfunction

" markdownlint
function! GenMarkdownLint() abort
  call s:copy_config('~/.dotfiles/templates/.markdownlint.yaml')
endfunction

" prettier
function! GenPrettierRC() abort
  call s:copy_config('~/.dotfiles/templates/.prettierrc.yaml')
endfunction

" semantic-release
function! GenReleaseRC() abort
  call s:copy_config('~/.dotfiles/templates/.releaserc.yaml')
endfunction

" editorconfig
function! GenEditorConfig() abort
  call s:copy_config('~/.dotfiles/templates/.editorconfig')
endfunction

""""""""""""""""""""""""""""""""""""""""
" UTILITIES
""""""""""""""""""""""""""""""""""""""""
function! Btm() abort
  terminal ++shell btm
endfunction
command! Btm call Btm()

function! BrewUp() abort
  terminal ++shell brew update && brew upgrade && brew cleanup
endfunction
command! BrewUp call BrewUp()
