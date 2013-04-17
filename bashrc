# Include generic shellrc.
[ -f "$HOME/.shellrc" ] && source "$HOME/.shellrc"

function parse_hostname {
	echo $1 | sed -e "s/^$USER-//"
}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000



PS1='\[\033[32m\]\u@$(parse_hostname \h)\[\033[00m\]:\[\033[34m\]\w$(__git_ps1 "\[\e[33m\](%s)\[\e[00m\]")\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;;
	*) ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
    complete -F _command run noout
fi


# Include a local bashrc
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
