# Include generic shellrc.
[ -f "$HOME/.shellrc" ] && source "$HOME/.shellrc"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
	PS1+='\[\e[1;31m\]'
else
	PS1+='\[\e[1;32m\]'
fi
PS1+='\u@${HOSTNAME##${SUDO_USER-$USER}-}'
PS1+='\[\e[m\]:'
PS1+='\[\e[1;34m\]\w'
PS1+='\[\e[1;33m\]$(__git_ps1 "(%s)")'
if [ $UID -eq 0 ]; then
	PS1+='\[\e[1;31m\]#\[\e[m\] '
else
	PS1+='\[\e[m\]$ '
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
    complete -F _command run noout
fi


# Include a local bashrc
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
