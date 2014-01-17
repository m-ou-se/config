" Vim color file
" Maintainer: David Ne\v{c}as (Yeti) <yeti@physics.muni.cz>
" Last Change: 2003-04-23
" URL: http://trific.ath.cx/Ftp/vim/colors/peachpuff.vim

" This color scheme uses a peachpuff background (what you've expected when it's
" called peachpuff?).
"
" Note: Only GUI colors differ from default, on terminal it's just `light'.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "trusty"

" Two-color terminals.
hi Cursor        term=reverse
hi DiffText      term=reverse
hi ErrorMsg      term=standout
hi FoldColumn    term=standout
hi Folded        term=standout
hi IncSearch     term=reverse
hi LineNr        term=reverse
hi MatchParen    term=reverse
hi ModeMsg       term=bold
hi MoreMsg       term=bold
hi Question      term=standout
hi StatusLineNC  term=reverse
hi StatusLine    term=bold,reverse
hi Title         term=bold
hi VertSplit     term=reverse
hi VisualNOS     term=bold
hi Visual        term=reverse
hi WarningMsg    term=standout
hi WildMenu      term=standout

hi Error         term=reverse
hi Todo          term=standout



" Color terminal.
hi Cursor        cterm=none ctermbg=Black
hi DiffAdd       cterm=none ctermbg=22
hi DiffChange    cterm=none ctermbg=17
hi DiffDelete    cterm=none ctermbg=52
hi DiffText      cterm=none ctermbg=54
hi Directory     cterm=none ctermfg=DarkBlue
hi ErrorMsg      cterm=none ctermfg=Grey
hi FoldColumn    cterm=none ctermfg=Black ctermbg=DarkGrey
hi Folded        cterm=none ctermfg=Black ctermbg=DarkGrey
hi IncSearch     cterm=reverse
hi LineNr        cterm=none ctermfg=Yellow ctermbg=235
hi MatchParen    cterm=none ctermfg=White ctermbg=DarkCyan
hi ModeMsg       cterm=bold
hi MoreMsg       cterm=none ctermfg=DarkGreen
hi NonText       cterm=none ctermfg=Yellow
hi Pmenu         cterm=none ctermfg=Black ctermbg=Magenta
hi PmenuSel      cterm=none ctermfg=Black ctermbg=Yellow
hi Question      cterm=none ctermfg=DarkGreen
hi Search        cterm=none ctermbg=Magenta ctermfg=White
hi SpecialKey    cterm=none ctermfg=DarkGray
hi StatusLineNC  cterm=reverse
hi StatusLine    cterm=bold,reverse
hi Title         cterm=none ctermfg=DarkMagenta
hi VertSplit     cterm=reverse
hi VisualNOS     cterm=bold,underline
hi Visual        cterm=reverse ctermbg=Black
hi WarningMsg    cterm=none ctermfg=DarkRed
hi WildMenu      cterm=none ctermfg=Black ctermbg=3

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


" GUI.
hi Cursor        gui=none guibg=#aaaaaa
hi DiffAdd       gui=none guibg=#009900
hi DiffChange    gui=none guibg=#0066ff
hi DiffDelete    gui=none guibg=#cc0000
hi DiffText      gui=none guibg=#9933cc
hi Directory     gui=none guifg=#0066ff
hi ErrorMsg      gui=none guifg=#aaaaaa
hi FoldColumn    gui=none guifg=#0066ff guibg=#aaaaaa
hi Folded        gui=none guifg=#0066ff guibg=#aaaaaa
hi IncSearch     gui=reverse
hi LineNr        gui=none guifg=#ffff33 guibg=#333333
hi MatchParen    gui=none guifg=#ffffff guibg=#009999
hi ModeMsg       gui=bold
hi MoreMsg       gui=none guifg=#009900
hi NonText       gui=none guifg=#ffff33
hi Normal        gui=none guifg=#aaaaaa guibg=#000000
hi Pmenu         gui=none guifg=#000000 guibg=#cc33ff
hi PmenuSel      gui=none guifg=#000000 guibg=#ffff33
hi Question      gui=none guifg=#009900
hi Search        gui=none guibg=#cc33ff guifg=#ffffff
hi SpecialKey    gui=none guifg=#333333
hi StatusLineNC  gui=reverse
hi StatusLine    gui=bold,reverse
hi Title         gui=none guifg=#9933cc
hi VertSplit     gui=reverse
hi VisualNOS     gui=bold,underline
hi Visual        gui=reverse guibg=#ffffff
hi WarningMsg    gui=none guifg=#cc0000
hi WildMenu      gui=none guifg=#000000 guibg=#cc9900

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
