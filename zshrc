source "$HOME/.shellrc"

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

autoload edit-command-line && zle -N edit-command-line
bindkey '\ee' edit-command-line

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
setopt autocd
setopt auto_pushd
setopt extendedglob
setopt notify
setopt prompt_subst
unsetopt beep
unsetopt nomatch

try_source "$config_dir/zsh-fix-keys"

autoload colors
colors

function update_title {
	case "$TERM" in
		xterm*|rxvt*) print -Pn "\e]2;%n@${HOST##${SUDO_USER-$USER}-}: %~\a" ;;
	esac
}
update_title

# Count all non-hidden files in a folder
function count_files {
	setopt localoptions
	setopt nullglob
	local files
	files=("${1:-.}"/*)
	echo "${#files}"
}

# Count all hidden files in a folder
function count_hidden_files {
	setopt localoptions
	setopt nullglob
	local files
	files=("${1:-.}"/.*)
	echo "${#files}"
}

function chpwd {
	update_title
	local count=$(count_files)
	local hidden=$(count_hidden_files)
	[ "$count" -le 50 ] && ls --group-directories-first -CF --color=always
	echo "Files: $count, hidden: $hidden"
}

function git_path {
	local p="$1"
	local result=""
	until [ "$p" = '.' -o "$p" = '/' ]; do
		local name="${p##*/}"
		local info=""
		if [ -e ${~p}/.git ]; then
			info="$info$(cd -q ${~p} && __git_ps1 "(%s)")"
		elif [ "true" = "$(cd -q ${~p} && git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
			info="$info$(
			cd -q ${~p}
			git diff --no-ext-diff --quiet --exit-code . || echo -n '*'
			git diff-index --cached --quiet HEAD -- . || echo -n '+'
			git ls-files --others --exclude-standard --error-unmatch -- . >/dev/null 2>/dev/null && echo -n '%%'
			)"
		fi
		if [ -n "$result" ]; then
			result=$(printf "$2/%s" "$name" "$info" "$result")
		else
			result=$(printf "$2" "$name" "$info")
		fi
		p="$(dname "$p")"
	done
	[ "$p" = '/' ] && result=$(printf "$2/%s" '' '' "$result")
	echo -n "$result"
}

function prompt {
	echo -n $'%(?,,\n)'
	if [ $UID -eq 0 ]; then
		echo -n "%{$fg[red]%}%n"
	else
		echo -n "%{$fg[green]%}%n"
	fi
	if [ -n "$HAS_SSHD_ANCESTOR" ]; then
		echo -n "%{$bold_color%}"
	fi
	echo -n "@${HOST##${SUDO_USER-$USER}-}"
	echo -n "%{$reset_color%}:"
	git_path "$(print -P '%~')" "%%{$fg[blue]%%}%s%%{$fg[yellow]%%}%s%%{$fg[magenta]%%}"
	echo -n "%{$reset_color%}"
	if [ $UID -eq 0 ]; then
		echo -n "%{$fg[red]%}#"
	else
		echo -n '$'
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
