# Kakoune default color scheme

# For Code
face global value red
face global type yellow
face global variable default
face global module green
face global function cyan
face global string red
face global keyword yellow
face global operator yellow
face global attribute green
face global comment blue
face global meta magenta
face global builtin default+b

# For markup
face global title blue
face global header cyan
face global bold red
face global italic yellow
face global mono green
face global block magenta
face global link cyan
face global bullet cyan
face global list yellow

# builtin faces
face global Default default,default
face global PrimarySelection white,blue+fg
face global SecondarySelection black,blue+fg
face global PrimaryCursor black,white+fg
face global SecondaryCursor black,white+fg
face global PrimaryCursorEol black,cyan+fg
face global SecondaryCursorEol black,cyan+fg
face global MenuForeground white,blue
face global MenuBackground blue,white
face global MenuInfo cyan
face global Information black,yellow
face global Error black,red+fg
face global StatusLine cyan,rgb:111111
face global StatusLineMode yellow,default
face global StatusLineInfo blue,default
face global StatusLineValue green,default
face global StatusCursor black,cyan
face global Prompt yellow,default
face global MatchingChar default,default+b

face global Whitespace rgb:444444,default+f
face global LineFlagErrors red,rgb:111111
face global LineFlagWarnings yellow,rgb:111111
face global LineNumbers rgb:444444,rgb:111111
face global LineNumberCursor default,default+r
face global BufferPadding blue,default

face global DiagnosticError   default,rgb:660000
face global DiagnosticWarning default,rgb:666600
