hi clear

if exists('syntax_on')
	syntax reset
endif

runtime colors/gruvbox.vim

let g:colors_name = 'gruvbox-custom'

let s:is_dark=(&background == 'dark')

hi! link SpecialKey GruvboxOrange
hi! link NonText GruvboxOrange
hi! link IndentTab GruvboxBg2

if s:is_dark
	hi CocHighlightText    cterm=NONE ctermbg=238  gui=NONE guibg=#444444
	hi CocErrorHighlight   cterm=NONE ctermbg=88   gui=NONE guibg=#883322
	hi CocWarningHighlight cterm=NONE ctermbg=94   gui=NONE guibg=#664422
	hi CocInfoHighlight    cterm=NONE ctermbg=58   gui=NONE guibg=#3e4e42
	hi CocHintHighlight    cterm=NONE ctermbg=60   gui=NONE guibg=#3e4e42
	hi CocFadeOut          cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
	hi CocMenuSel          cterm=NONE ctermbg=240  gui=NONE guibg=#585858

	hi SpellCap   cterm=NONE ctermbg=88 gui=italic guibg=#883322
	hi SpellBad   cterm=NONE ctermbg=88 gui=italic guibg=#883322
	hi SpellLocal cterm=NONE ctermbg=88 gui=italic guibg=#883322
	hi SpellRare  cterm=NONE ctermbg=88 gui=italic guibg=#883322
else
	hi CocHighlightText    cterm=NONE ctermbg=253  gui=NONE guibg=#dadada
	hi CocErrorHighlight   cterm=NONE ctermbg=88   gui=NONE guibg=#ddaa99
	hi CocWarningHighlight cterm=NONE ctermbg=94   gui=NONE guibg=#ddaa66
	hi CocInfoHighlight    cterm=NONE ctermbg=58   gui=NONE guibg=#bbeeff
	hi CocHintHighlight    cterm=NONE ctermbg=60   gui=NONE guibg=#bbeeff
	hi CocFadeOut          cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
	hi CocMenuSel          cterm=NONE ctermbg=251  gui=NONE guibg=#c6c6c6

	hi SpellCap   cterm=NONE ctermbg=88 gui=italic guibg=#ddaa99
	hi SpellBad   cterm=NONE ctermbg=88 gui=italic guibg=#ddaa99
	hi SpellLocal cterm=NONE ctermbg=88 gui=italic guibg=#ddaa99
	hi SpellRare  cterm=NONE ctermbg=88 gui=italic guibg=#ddaa99
endif


hi! link Comment GruvboxOrange
hi! link SpecialComment GruvboxPurple
hi! link CocRustTypeHint GruvboxBg4
hi link Operator GruvboxBlue
