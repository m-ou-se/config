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


hi Normal guifg=#aaaaaa guibg=Black
hi Cursor term=reverse ctermbg=Black
hi NonText ctermfg=Yellow

hi DiffAdd ctermbg=DarkGreen
hi DiffChange ctermbg=DarkBlue
hi DiffDelete ctermbg=DarkRed
hi DiffText term=reverse ctermbg=DarkMagenta

hi Directory ctermfg=DarkBlue
hi ErrorMsg term=standout ctermfg=Grey
hi FoldColumn term=standout ctermfg=DarkBlue ctermbg=Grey
hi Folded term=standout ctermfg=DarkBlue ctermbg=Grey
hi IncSearch term=reverse cterm=reverse
hi LineNr ctermfg=Yellow ctermbg=235
hi MatchParen ctermfg=White ctermbg=DarkCyan
hi ModeMsg term=bold cterm=bold
hi MoreMsg term=bold ctermfg=DarkGreen
hi Question term=standout ctermfg=DarkGreen
hi Search ctermbg=Magenta ctermfg=White
hi SpecialKey ctermfg=DarkGray
hi StatusLineNC term=reverse cterm=reverse
hi StatusLine term=bold,reverse cterm=bold,reverse
hi Title term=bold ctermfg=DarkMagenta
hi VertSplit term=reverse cterm=reverse
hi VisualNOS term=bold,underline cterm=bold,underline
hi Visual term=reverse cterm=reverse
hi WarningMsg term=standout ctermfg=DarkRed
hi WildMenu term=standout ctermfg=Black ctermbg=3

" Colors for syntax highlighting
hi Comment ctermfg=DarkBlue
hi Constant ctermfg=DarkRed
hi Special ctermfg=DarkMagenta
hi Identifier cterm=NONE ctermfg=DarkCyan
hi Statement ctermfg=3
hi PreProc ctermfg=DarkMagenta
hi Type ctermfg=DarkGreen
hi Ignore ctermfg=Grey
hi Error term=reverse ctermfg=Grey ctermbg=DarkRed
hi Todo term=standout ctermfg=Black ctermbg=3

hi Pmenu ctermfg=Black ctermbg=Magenta
hi PmenuSel ctermfg=Black ctermbg=Yellow
