# Include generic shellrc.
[ -f "$HOME/.shellrc" ] && source "$HOME/.shellrc"

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

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify prompt_subst auto_pushd correct
unsetopt beep
bindkey -e

autoload colors
colors

# Set terminal title to show the current directory.
function update_title {
	print -Pn "\e]2;%n@${HOST##${SUDO_USER-$USER}-}: %~\a"
}
update_title

function chpwd {
	update_title
	
	# Print files when changing directory.
	[ "$PWD" != ~ ] && ls -CF --color=always
}

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

function __zsh_git_ps1 {
	local output="$(__git_ps1 "(%s)")"
	local pat="%"
	echo "${output/$pat/%%}"
}

e=$'\e'
PS1+="%n@"${HOST##${SUDO_USER-$USER}-}
PS1+="%{$reset_color%}:"
PS1+="%{$fg[blue]%}%~"
PS1+="%{$reset_color%}"
PS1+="%{$fg[yellow]%}"'$(__zsh_git_ps1)'"%{$reset_color%}"
PS1+=$PS1_END
PS2="$PS1"
PS2+="%{$fg[blue]%}%_%{$reset_color%}> "


RPROMPT="%(?,,%{${e}[A$fg[red]%}%? ✗%{$reset_color${e}[B%}"
