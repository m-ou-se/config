# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source "$HOME/.config/config_dir/shellrc"

try_source /usr/share/doc/pkgfile/command-not-found.bash

shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000

function update_ps1 {
	PS1=''
	case "$TERM" in
		xterm*|rxvt*|alacritty*) PS1+='\[\e]0;\u@\h: \w\a\]' ;;
		*) ;;
	esac
	if [ $UID -eq 0 ]; then
		PS1+='\[\e[31m\]'
	elif [ "$TTY_USER" != "$USER" ]; then
		PS1+='\[\e[33m\]'
	else
		PS1+='\[\e[32m\]'
	fi
	PS1+='\u'
	if [ -n "$TTY_HOST" ]; then
		PS1+='\[\e[1m\]'
	fi
	PS1+='@${HOSTNAME%%.*}'
	PS1+='\[\e[m\]:'
	PS1+="$(git_prompt_path)"
	if [ $UID -eq 0 ]; then
		PS1+='\[\e[31m\]#\[\e[m\] '
	else
		PS1+='\[\e[m\]$ '
	fi
}

PROMPT_COMMAND=update_ps1

try_source /usr/share/fzf/key-bindings.bash
try_source /usr/share/fzf/completion.bash

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
