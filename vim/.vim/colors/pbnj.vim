"        _            _ 
"  _ __ | |__  _ __  (_)
" | '_ \| '_ \| '_ \ | |
" | |_) | |_) | | | || |
" | .__/|_.__/|_| |_|/ |
" |_|              |__/ 
"
" File:       pbnj.vim
" Maintainer: pbnj <petermbenjamin@gmail.com>
" Modified:   Fri Feb 26 09:39:36 PST 2021
" License:    MIT


if !has('gui_running') && &t_Co < 256
  finish
endif

hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'pbnj'

highlight SignColumn NONE

highlight ALEInfo term=underline cterm=underline ctermbg=NONE ctermfg=NONE gui=undercurl guibg=NONE guifg=NONE
highlight ALEWarning term=underline cterm=underline ctermbg=NONE ctermfg=NONE gui=undercurl guibg=NONE guifg=NONE
highlight ALEError   term=underline cterm=underline ctermbg=NONE ctermfg=NONE gui=undercurl guibg=NONE guifg=NONE

highlight LineNr ctermfg=DarkGray guifg=DarkGray
highlight SpecialKey ctermfg=DarkGray guifg=DarkGray
highlight NonText ctermfg=DarkGray guifg=DarkGray
highlight Comment ctermfg=DarkGray guifg=DarkGray
highlight Pmenu ctermbg=White ctermfg=Black guibg=White guifg=Black
highlight PmenuSel ctermbg=DarkGray ctermfg=White cterm=bold guibg=DarkGray guifg=White gui=bold
highlight Visual ctermbg=White ctermfg=Black guibg=White guifg=Black

highlight DiffAdd ctermbg=Green ctermfg=Black
highlight diffAdded ctermbg=Green ctermfg=Black
highlight DiffDelete ctermbg=Red ctermfg=Black
highlight diffRemoved ctermbg=Red ctermfg=Black
highlight DiffChange ctermbg=Yellow ctermfg=Black
highlight diffChanged ctermbg=Yellow ctermfg=Black
