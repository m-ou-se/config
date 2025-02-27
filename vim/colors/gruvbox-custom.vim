hi clear

if exists("syntax_on")
	syntax reset
endif

runtime colors/gruvbox.vim

let g:colors_name = "gruvbox-custom"

let s:is_dark=(&background == 'dark')

hi! link SpecialKey GruvboxOrange
hi! link NonText GruvboxOrange
hi! link IndentTab GruvboxBg2

if s:is_dark
	hi CocErrorHighlight   cterm=none ctermbg=88   gui=none guibg=#883322
	hi CocWarningHighlight cterm=none ctermbg=94   gui=none guibg=#664422
	hi CocInfoHighlight    cterm=none ctermbg=58   gui=none guibg=#3e4e42
	hi CocHintHighlight    cterm=none ctermbg=60   gui=none guibg=#3e4e42
	hi CocFadeOut          cterm=none ctermbg=none gui=none guibg=none
	hi CocMenuSel          cterm=none ctermbg=240  gui=none guibg=#585858

	hi SpellCap   cterm=none ctermbg=88 gui=italic guibg=#883322
	hi SpellBad   cterm=none ctermbg=88 gui=italic guibg=#883322
	hi SpellLocal cterm=none ctermbg=88 gui=italic guibg=#883322
	hi SpellRare  cterm=none ctermbg=88 gui=italic guibg=#883322
else
	hi CocErrorHighlight   cterm=none ctermbg=88   gui=none guibg=#ddaa99
	hi CocWarningHighlight cterm=none ctermbg=94   gui=none guibg=#ddaa66
	hi CocInfoHighlight    cterm=none ctermbg=58   gui=none guibg=#bbeeff
	hi CocHintHighlight    cterm=none ctermbg=60   gui=none guibg=#bbeeff
	hi CocFadeOut          cterm=none ctermbg=none gui=none guibg=none
	hi CocMenuSel          cterm=none ctermbg=251  gui=none guibg=#c6c6c6

	hi SpellCap   cterm=none ctermbg=88 gui=italic guibg=#ddaa99
	hi SpellBad   cterm=none ctermbg=88 gui=italic guibg=#ddaa99
	hi SpellLocal cterm=none ctermbg=88 gui=italic guibg=#ddaa99
	hi SpellRare  cterm=none ctermbg=88 gui=italic guibg=#ddaa99
endif

hi CocHighlightText cterm=none ctermbg=238 gui=none guibg=#444444

hi! link Comment GruvboxOrange
hi! link SpecialComment GruvboxPurple
hi! link CocRustTypeHint GruvboxBg4
hi link Operator GruvboxBlue
