source "$HOME/.config/config_dir/shellrc"

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
setopt hist_ignore_dups
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
	test_command dname || return 1
	setopt localoptions
	setopt re_match_pcre
	local p="$1"
	local result=""
	until [ "$p" = '.' -o "$p" = '/' ]; do
		local name="${p##*/}"
		local info=""
		if [ -e ${~p}/.git ]; then
			info="$info$(cd -q ${~p} && __git_ps1 "(%s)")"
		else
			info="$info$(
			cd -q ${~p}
			st=$(git status --porcelain . 2>/dev/null)
			if [ "$st" =~ '(?:^|\n).\w' ]; then echo -n '*'; fi
			if [ "$st" =~ '(?:^|\n)\w' ]; then echo -n '+'; fi
			if [ "$st" =~ '(?:^|\n)\?' ]; then echo -n '%%'; fi
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

print_status="0"

function preexec {
	print_status="1"
}

function precmd {
	local exit_code="$?"
	[ $print_status = "1" ] && [ "$exit_code" -ne 0 ] && echo "$fg[red]✗ - status code $exit_code$reset_color"
	print_status="0"
}

function prompt {
	if [ $UID -eq 0 ]; then
		echo -n "%{$fg[red]%}%n"
	elif [ -n "$SUDO_USER" ] && [ "$USER" != "$SUDO_USER" ]; then
		echo -n "%{$fg[yellow]%}%n"
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
	echo -n '%(1j.[%j].)'
	if [ $UID -eq 0 ]; then
		echo -n "%{$fg[red]%}#"
	else
		echo -n '$'
	fi
	echo -n "%{$reset_color%} "
}

function prompt2 {
	prompt
	echo -n "%{$fg[magenta]%}%_%{$reset_color%}> "
}

PROMPT='$(prompt)'
PROMPT2='$(prompt2)'

if try_source "$config_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"; then
	ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)
fi

# Include a local zshrc
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
