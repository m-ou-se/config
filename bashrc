source "$HOME/.config/config_dir/shellrc"

try_source /usr/share/doc/pkgfile/command-not-found.bash

shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000



PS1=''
# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*) PS1+='\[\e]0;\u@\h: \w\a\]' ;;
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
PS1+='@${HOSTNAME##${TTY_USER-$USER}-}'
PS1+='\[\e[m\]:'
PS1+='\[\e[34m\]\w'
PS1+='\[\e[33m\]$(__git_ps1 "(%s)")'
if [ $UID -eq 0 ]; then
	PS1+='\[\e[31m\]#\[\e[m\] '
else
	PS1+='\[\e[m\]$ '
fi

[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
