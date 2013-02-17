# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

function parse_hostname {
	echo $1 | sed -e "s/^$USER-//"
}


GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose"


if [ "$TERM" = "linux" ]; then
	echo -en "\e]P0000000" #black
	echo -en "\e]P84C4C4C" #darkgrey
	echo -en "\e]P1CD0000" #darkred
	echo -en "\e]P9FF0000" #red
	echo -en "\e]P200CD00" #darkgreen
	echo -en "\e]PA00FF00" #green
	echo -en "\e]P3CDCD00" #brown
	echo -en "\e]PBDDDD00" #yellow
	echo -en "\e]P41E90FF" #darkblue
	echo -en "\e]PC4682B4" #blue
	echo -en "\e]P5CD00CD" #darkmagenta
	echo -en "\e]PDFF00FF" #magenta
	echo -en "\e]P600CDCD" #darkcyan
	echo -en "\e]PE00FFFF" #cyan
	echo -en "\e]P7E5E5E5" #lightgrey
	echo -en "\e]PFFFFFFF" #white
fi



# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[32m\]\u@$(parse_hostname \h)\[\033[00m\]:\[\033[34m\]\w$(__git_ps1 "\[\e[33m\](%s)\[\e[00m\]")\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@$(parse_hostname \h):\w$__git_ps1 "(%s)")\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias clip='xclip -i -selection clipboard'
# Include aliases from .aliases.
[ -f .aliases ] && . .aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
    complete -F _command run noout
fi

function noout() {
	"$@" 1>/dev/null 2>/dev/null </dev/null
}

function run() {
	"$@" 1>/dev/null 2>/dev/null </dev/null &
}

function o() {
	xdg-open "$@" 1>/dev/null 2>/dev/null </dev/null
}

# Include a local bashrc
test -f $HOME/.bashrc.local && . $HOME/.bashrc.local

export EDITOR=vim
