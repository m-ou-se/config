[ -f "$HOME/.shellrc" ] && source "$HOME/.shellrc"
try_source /usr/share/doc/pkgfile/command-not-found.zsh
try_source /etc/zsh_command_not_found

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
try_source "$config_dir/zsh-fix-keys"

autoload colors
colors

function update_title {
	case "$TERM" in
		xterm*|rxvt*) print -Pn "\e]2;%n@${HOST##${SUDO_USER-$USER}-}: %~\a" ;;
	esac
}
update_title

function chpwd {
	update_title
	local count=$(count_files)
	[ "$count" -le 50 ] && ls -CF --color=always || echo "Too many files to display ($count)."
}

function git_info {
	local output="$(__git_ps1 "(%s)")"
	echo "${output//\%/%%}"
}

function git_path {
	local p="$1"
	local result=""
	until [ "$p" = '.' -o "$p" = '/' ]; do
		local name="${p##*/}"
		local info="$(cd -q ${~p} && test -e .git && git_info)"
		result=$(printf "$2/%s" "$name" "$info" "$result")
		p="$(dirname "$p")"
	done
	echo -n $result
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
	git_path "$(print -P '%~')" "%%{$fg[blue]%%}%s%%{$fg[yellow]%%}%s%%{$fg[blue]%%}"
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
