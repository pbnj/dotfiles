"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS: Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
function! GutterColors() abort
  highlight SignColumn cterm=NONE ctermbg=NONE ctermfg=NONE   gui=NONE guibg=NONE guifg=NONE
  highlight DiffAdd    cterm=NONE ctermbg=NONE ctermfg=Green  gui=NONE guibg=NONE guifg=Green
  highlight DiffChange cterm=NONE ctermbg=NONE ctermfg=Yellow gui=NONE guibg=NONE guifg=Orange
  highlight DiffDelete cterm=NONE ctermbg=NONE ctermfg=Red    gui=NONE guibg=NONE guifg=Red
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call GutterColors()
augroup END

syntax off          " disable vim syntax
let g:syntax_on = 0 " disable vim-sensible syntax
call GutterColors()

" colorscheme default
set background=light

let loaded_netrwPlugin = 1 " Disable netrw plugin

" neovim specific settings
if has('nvim')
  set inccommand=split
  set termguicolors
endif

" set font for vim GUIs
if has("gui_running")
  if has("gui_gtk")
    set guifont=JetBrainsMono\ Nerd\ Font\ 11
  elseif has("gui_macvim")
    set guifont=JetBrainsMono\ Nerd\ Font:h11
  elseif has("gui_win32")
    set guifont=JetBrainsMono\ Nerd\ Font:h11:cANSI
  endif
endif

" statusline
set statusline=
set statusline+=%F                        " file name
set statusline+=%m                        " modified
set statusline+=%r                        " read only
set statusline+=%h                        " help
set statusline+=%w                        " preview
set statusline+=\ [%L]                    " number of lines
set statusline+=[%{&ff}]                  " file format
set statusline+=%y                        " syntax
set statusline+=[%p%%]                    " percentage into file
set statusline+=[%04l,%04v]               " current line & column
set statusline+=\ %{FugitiveStatusline()} " git info
