if &term =~ "xterm.*" || &term =~ "screen*" || &term =~ "rxvt*"
	let &t_ti .= "\<Esc>[?2004h"
	let &t_te .= "\<Esc>[?2004l"

	function! TerminalPasteBegin(b, e)
		set pastetoggle=<Esc>[201
		execute "imap <silent> <buffer> <expr> ~ TerminalPasteEnd(" . a:e . ")"
		set paste
		return a:b
	endfunction

	function! TerminalPasteEnd(e)
		set pastetoggle=
		iunmap <buffer> ~
		if a:e
			return "\<Esc>"
		else
			return ''
		endif
	endfunction

	execute "set <f28>=\<Esc>[200~"
	execute "set <f29>=\<Esc>[201~"
	nmap <special> <expr> <f28> TerminalPasteBegin("i", 1)
	imap <special> <expr> <f28> TerminalPasteBegin("", 0)
	vmap <special> <expr> <f28> TerminalPasteBegin("c", 1)
	cmap <special> <f28> <nop>
	cmap <special> <f29> <nop>
endif
