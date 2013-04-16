# The following lines were added by compinstall

zstyle ':completion:*' auto-description '<%d>'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format '[%d]'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %l: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %l%s
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/maarten/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify prompt_subst
setopt auto_pushd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

config_dir=$(dirname "$(readlink -f "$HOME/.zshrc")")

source "$config_dir/git-prompt.sh"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose"

autoload colors
colors

PS1=$'%(?,,\n)'
PS1_END=""
if [ $UID -eq 0 ]; then
	PS1+="%{$fg[red]%}"
	PS1_END+="%{$fg[red]%}#"
else
	PS1+="%{$fg[green]%}"
	PS1_END+="%%"
fi
PS1_END+="%{$reset_color%} "


e=$'\e'
PS1+="%n@"${HOST##${SUDO_USER-$USER}-}
PS1+="%{$reset_color%}:"
PS1+="%{$fg[blue]%}%~"
PS1+="%{$reset_color%}"
PS1+='$(__git_ps1 "('"%%{$fg[yellow]%%}%s%%{$reset_color%%}"')")'
PS1+=$PS1_END
PS2="$PS1"
PS2+="%{$fg[blue]%}%_%{$reset_color%}> "


RPROMPT="%(?,,%{${e}[A$fg[red]%}%? ✗%{$reset_color${e}[B%}"
