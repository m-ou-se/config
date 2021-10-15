set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

runtime colors/gruvbox.vim

let g:colors_name = "gruvbox-custom"

hi! link SpecialKey GruvboxOrange
hi! link NonText GruvboxOrange
hi! link IndentTab GruvboxBg2

hi CocErrorHighlight   cterm=none ctermbg=88   gui=none guibg=#883322
hi CocWarningHighlight cterm=none ctermbg=94   gui=none guibg=#664422
hi CocInfoHighlight    cterm=none ctermbg=58   gui=none guibg=#3e4e42
hi CocHintHighlight    cterm=none ctermbg=60   gui=none guibg=#3e4e42
hi CocFadeOut          cterm=none ctermbg=none gui=none guibg=none

hi SpellCap   cterm=none ctermbg=88 gui=italic guibg=#883322
hi SpellBad   cterm=none ctermbg=88 gui=italic guibg=#883322
hi SpellLocal cterm=none ctermbg=88 gui=italic guibg=#883322
hi SpellRare  cterm=none ctermbg=88 gui=italic guibg=#883322

hi! link Comment GruvboxOrange
hi! link SpecialComment GruvboxPurple
hi! link CocRustTypeHint GruvboxBg4
hi link Operator GruvboxBlue
