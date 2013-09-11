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


hi Normal guifg=grey guibg=black

hi Cursor term=reverse ctermbg=black
hi DiffAdd term=bold ctermbg=blue
hi DiffChange term=bold ctermbg=5
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6
hi DiffText term=reverse cterm=bold ctermbg=1
hi Directory term=bold ctermfg=4
hi ErrorMsg term=standout cterm=bold ctermfg=7
hi FoldColumn term=standout ctermfg=4 ctermbg=7
hi Folded term=standout ctermfg=4 ctermbg=7
hi IncSearch term=reverse cterm=reverse
hi LineNr ctermfg=Yellow ctermbg=235
hi ModeMsg term=bold cterm=bold
hi MoreMsg term=bold ctermfg=2
hi NonText ctermfg=Yellow
hi Question term=standout ctermfg=2
hi Search ctermbg=Magenta ctermfg=White
hi SpecialKey ctermfg=DarkGray
hi StatusLineNC term=reverse cterm=reverse
hi StatusLine term=bold,reverse cterm=bold,reverse
hi Title term=bold ctermfg=5
hi VertSplit term=reverse cterm=reverse
hi VisualNOS term=bold,underline cterm=bold,underline
hi Visual term=reverse cterm=reverse
hi WarningMsg term=standout ctermfg=1
hi WildMenu term=standout ctermfg=0 ctermbg=3

" Colors for syntax highlighting
hi Comment ctermfg=4
hi Constant ctermfg=1
hi Special term=bold ctermfg=5
hi Identifier term=underline ctermfg=6
hi Statement term=bold ctermfg=3
hi PreProc term=underline ctermfg=5
hi Type term=underline ctermfg=2
hi Ignore cterm=bold ctermfg=7
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1
hi Todo term=standout ctermfg=0 ctermbg=3

hi Pmenu ctermfg=Black ctermbg=Magenta
hi PmenuSel ctermfg=Black ctermbg=Yellow
