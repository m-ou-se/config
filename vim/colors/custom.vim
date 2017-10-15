set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "custom"

" Color terminal
hi Cursor        cterm=none ctermbg=Black
hi DiffAdd       cterm=none ctermbg=22
hi DiffChange    cterm=none ctermbg=17
hi DiffDelete    cterm=none ctermbg=52 ctermfg=52
hi DiffText      cterm=none ctermbg=54
hi Directory     cterm=none ctermfg=DarkBlue
hi ErrorMsg      cterm=none ctermfg=Grey
hi FoldColumn    cterm=none ctermfg=Black ctermbg=DarkGrey
hi Folded        cterm=none ctermfg=Black ctermbg=DarkGrey
hi IncSearch     cterm=reverse
hi LineNr        cterm=none ctermfg=240 ctermbg=233
hi MatchParen    cterm=bold ctermfg=White ctermbg=none
hi ModeMsg       cterm=bold
hi MoreMsg       cterm=none ctermfg=DarkGreen
hi NonText       cterm=none ctermfg=Yellow
hi Pmenu         cterm=none ctermfg=Grey ctermbg=52
hi PmenuSel      cterm=none ctermfg=White ctermbg=88
hi Question      cterm=none ctermfg=DarkGreen
hi Search        cterm=none ctermbg=Magenta ctermfg=White
hi SpecialKey    cterm=bold ctermfg=DarkYellow
hi StatusLineNC  cterm=none ctermfg=240 ctermbg=234
hi StatusLine    cterm=bold ctermfg=250 ctermbg=234
hi Title         cterm=none ctermfg=DarkMagenta
hi VertSplit     cterm=none ctermfg=234 ctermbg=234
hi VisualNOS     cterm=bold,underline
hi Visual        cterm=reverse ctermbg=Black
hi WarningMsg    cterm=none ctermfg=DarkRed
hi WildMenu      cterm=none ctermfg=Black ctermbg=3
hi ColorColumn   ctermbg=17
hi SignColumn    cterm=none ctermfg=14 ctermbg=233
hi FoldColumn    cterm=none ctermfg=Grey ctermbg=233
hi EndOfBuffer   cterm=none ctermfg=237 ctermbg=Black
hi IndentTab     cterm=none ctermfg=240
hi Comment       cterm=none ctermfg=DarkBlue
hi Constant      cterm=none ctermfg=DarkRed
hi Error         cterm=none ctermfg=Grey ctermbg=DarkRed
hi Identifier    cterm=none ctermfg=DarkCyan
hi Ignore        cterm=none ctermfg=Grey
hi PreProc       cterm=none ctermfg=DarkMagenta
hi Special       cterm=none ctermfg=DarkMagenta
hi Statement     cterm=none ctermfg=3
hi Todo          cterm=none ctermfg=Black ctermbg=3
hi Type          cterm=none ctermfg=DarkGreen
hi SpellBad      cterm=none ctermbg=88
hi SpellCap      cterm=none ctermbg=94
hi SpellRare     cterm=none ctermbg=54
hi SpellLocal    cterm=none ctermbg=18
hi Whitespace    cterm=bold ctermfg=DarkYellow

" GUI
hi Cursor        gui=none guibg=#aaaaaa
hi DiffAdd       gui=none guibg=#005f00
hi DiffChange    gui=none guibg=#00005f
hi DiffDelete    gui=none guibg=#5f0000 guifg=#5f0000
hi DiffText      gui=none guibg=#4f0087
hi Directory     gui=none guifg=#0066ff
hi ErrorMsg      gui=none guifg=#aaaaaa
hi FoldColumn    gui=none guifg=#0066ff guibg=#aaaaaa
hi Folded        gui=none guifg=#0066ff guibg=#aaaaaa
hi IncSearch     gui=reverse
hi LineNr        gui=none guifg=#585858 guibg=#262626
hi MatchParen    gui=none guifg=#ffffff guibg=#000000
hi ModeMsg       gui=bold
hi MoreMsg       gui=none guifg=#009900
hi NonText       gui=none guifg=#ffff33
hi Normal        gui=none guifg=#aaaaaa guibg=#000000
hi Pmenu         gui=none guifg=#aaaaaa guibg=#5f0000
hi PmenuSel      gui=none guifg=#ffffff guibg=#870000
hi Question      gui=none guifg=#009900
hi Search        gui=none guibg=#cc33ff guifg=#ffffff
hi SpecialKey    gui=none guifg=#cc9900
hi StatusLineNC  gui=none guifg=#585858 guibg=#1c1c1c
hi StatusLine    gui=none guifg=#bcbcbc guibg=#1c1c1c
hi Title         gui=none guifg=#9933cc
hi VertSplit     gui=none guifg=#1c1c1c guibg=#1c1c1c
hi VisualNOS     gui=bold,underline
hi Visual        gui=reverse guibg=#ffffff
hi WarningMsg    gui=none guifg=#cc0000
hi WildMenu      gui=none guifg=#000000 guibg=#cc9900
hi ColorColumn   guibg=#00005f
hi SignColumn    gui=none guibg=#262626
hi FoldColumn    gui=none guifg=#aaaaaa guibg=#262626
hi EndOfBuffer   gui=none guifg=#585858 guibg=#000000
hi IndentTab     gui=none guifg=#262626
hi Comment       gui=none guifg=#0066ff
hi Constant      gui=none guifg=#cc0000
hi Error         gui=none guifg=#aaaaaa guibg=#cc0000
hi Identifier    gui=none guifg=#009999
hi Ignore        gui=none guifg=#aaaaaa
hi PreProc       gui=none guifg=#9933cc
hi Special       gui=none guifg=#9933cc
hi Statement     gui=none guifg=#cc9900
hi Todo          gui=none guifg=#000000 guibg=#cc9900
hi Type          gui=none guifg=#009900
hi Whitespace    gui=none guifg=#cc9900
