[ -f "$HOME/.shellrc" ] && source "$HOME/.shellrc"

GIT_PS1_SHOWUPSTREAM=(${(s/ /)GIT_PS1_SHOWUPSTREAM})

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
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
setopt autocd
setopt auto_pushd
setopt correct
setopt extendedglob
setopt nomatch
setopt notify
setopt prompt_subst
unsetopt beep

bindkey -e
bindkey '^[[Z' reverse-menu-complete
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

autoload colors
colors

function update_title {
	print -Pn "\e]2;%n@${HOST##${SUDO_USER-$USER}-}: %~\a"
}
update_title

function chpwd {
	update_title
	[ "$PWD" != ~ ] && ls -CF --color=always
}

function git_prompt {
	local output="$(__git_ps1 "(%s)")"
	echo "${output//\%/%%}"
}

function prompt {
	echo -n $'%(?,,\n)'
	if [ $UID -eq 0 ]; then
		echo -n "%{$fg[red]%}"
	else
		echo -n "%{$fg[green]%}"
	fi
	echo -n "%n@"${HOST##${SUDO_USER-$USER}-}
	echo -n "%{$reset_color%}:"
	echo -n "%{$fg[blue]%}%~"
	echo -n "%{$reset_color%}"
	echo -n "%{$fg[yellow]%}"
	echo -n "$(git_prompt)"
	echo -n "%{$reset_color%}"
	if [ $UID -eq 0 ]; then
		echo -n "%{$fg[red]%}#"
	else
		echo -n "%%"
	fi
	echo -n "%{$reset_color%} "
}

function rprompt {
	echo -n "%(?,,%{\e[A$fg[red]%}%? ✗%{$reset_color\e[B%}"
}

function prompt2 {
	prompt
	echo -n "%{$fg[magenta]%}%_%{$reset_color%}> "
}

PROMPT='$(prompt)'
RPROMPT='$(rprompt)'
PROMPT2='$(prompt2)'
