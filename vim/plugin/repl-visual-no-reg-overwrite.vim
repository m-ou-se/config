"=============================================================================
" $Id$
" File:		repl-visual-no-reg-overwrite.vim                                           {{{1
" Author:	Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
"		<URL:http://code.google.com/p/lh-vim/>
" Version:	2.0
" Created:	14th Nov 2008
" Last Update:	$Date$
"------------------------------------------------------------------------
" Description:	
"       Provides a way to paste over the visual selection without overwriting
"       the default register.
"       NB: 
"       - A register can be specified to select what shall be pasted over
"         -> e.g.:  "ap  will paste @a over the selection
"       - &clipboard==unnamed & unnamedplus are taken into account
" 
"------------------------------------------------------------------------
" Installation:	
"       Either drop the file into {rtp}/macros/ and source it from your .vimrc,
"       or put it into {rtp}/plugin/
" History:	
"       v1.0: answers <URL:http://stackoverflow.com/questions/290465/vim-how-to-paste-over-without-overwriting-register>
"       v1.1: restricted to pure visual-mode (select-mode is not impacted)
"       v2.0: Take &clipboard into account.
" }}}1
"=============================================================================

let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
" I haven't found how to hide this function (yet)
function! RestoreRegister()
  if &clipboard == 'unnamed'
    let @* = s:restore_reg
  elseif &clipboard == 'unnamedplus'
    let @+ = s:restore_reg
  else
    let @" = s:restore_reg
  endif
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" This supports "rp that permits to replace the visual selection with the
" contents of @r
xnoremap <silent> <expr> p <sid>Repl()

"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
