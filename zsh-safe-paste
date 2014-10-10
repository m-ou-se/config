# Code from Mikael Magnusson: http://www.zsh.org/mla/users/2011/msg00367.html
#
# Requires xterm, urxvt, iTerm2 or any other terminal that supports bracketed
# paste mode as documented: http://www.xfree86.org/current/ctlseqs.html

bindkey -N safe-paste
bindkey -R -M safe-paste "^@"-"\M-^?" safe-paste-insert
bindkey '^[[200~' safe-paste-start
bindkey -M safe-paste '^[[201~' safe-paste-end
bindkey -M safe-paste -s '^M' '^J'

zle -N safe-paste-start   _safe_paste_start
zle -N safe-paste-end     _safe_paste_end
zle -N safe-paste-insert  _safe_paste_insert
zle -N zle-line-init      _safe_paste_zle_line_init
zle -N zle-line-finish    _safe_paste_zle_line_finish

function _safe_paste_start {
	bindkey -A safe-paste main
}

function _safe_paste_end {
	bindkey -e
	LBUFFER+=$_safe_paste_content
	unset _safe_paste_content
}

function _safe_paste_insert {
	_safe_paste_content+=$KEYS
}

function _safe_paste_zle_line_init {
	printf '\e[?2004h'
}

function _safe_paste_zle_line_finish {
	printf '\e[?2004l'
}
