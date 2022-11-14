unsetopt nomatch
source "$HOME/.profile"

source "$HOME/.config/config_dir/shellrc"

zstyle ':completion:*' auto-description '<%d>'
zstyle ':completion:*' completer _complete _ignored
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

if type brew &>/dev/null; then
	fpath+=("$(brew --prefix)/share/zsh/site-functions")
fi
fpath+=("$HOME/.local/share/zsh/site-functions")
autoload -Uz compinit
compinit

autoload edit-command-line && zle -N edit-command-line
bindkey '\ee' edit-command-line

bindkey '^q' push-line-or-edit

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory
setopt histignorespace
setopt auto_pushd
setopt extendedglob
setopt notify
setopt prompt_subst
setopt hist_ignore_dups
unsetopt beep

WORDCHARS=${WORDCHARS/\/}

try_source "$HOME/.config/config_dir/zsh-fix-keys"

autoload colors
colors

function update_title {
	case "$TERM" in
		xterm*|rxvt*|alacritty*) print -Pn "\e]2;%n@${HOST##${TTY_USER-$USER}-}: %~\a" ;;
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
	local count=$(count_files)
	local hidden=$(count_hidden_files)
	[ "$count" -le 50 ] && ls --group-directories-first -F --color=always
	echo "Files: $count, hidden: $hidden"
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
	echo -n "%{"
	update_title
	echo -n "%}"

	echo -n "%{$bold_color$fg[black]%}${(l:$NESTEDSHELLS::$$:)}%{$reset_color%}"
	if [ $UID -eq 0 ]; then
		echo -n "%{$fg[red]%}%n"
	elif [ "$TTY_USER" != "$USER" ]; then
		echo -n "%{$fg[yellow]%}%n"
	else
		echo -n "%{$fg[green]%}%n"
	fi
	if [ -n "$TTY_HOST" ]; then
		echo -n "%{$bold_color%}"
	fi
	echo -n "@${HOST##${TTY_USER-$USER}-}"
	echo -n "%{$reset_color%}:"
	git_prompt_path
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

command_not_found_handler() {
	printf 'zsh: command not found: %s\n' "$1"
	local pkgs files=()
	if test_command pacman; then
		files=(${(f)"$(pacman -F --machinereadable -- "/usr/bin/${1}")"})
		if (( ${#files[@]} )); then
			printf '\r%s may be found in the following packages:\n' "$1"
			local res=() repo package version file
			for file in "$files[@]"; do
				res=("${(0)file}")
				repo="$res[1]"
				package="$res[2]"
				version="$res[3]"
				file="$res[4]"
				printf '  %s/%s %s: /%s\n' "$repo" "$package" "$version" "$file"
			done
		fi
	fi
	return 127
}

try_source /usr/share/fzf/key-bindings.zsh
try_source /usr/share/fzf/completion.zsh

# Include a local zshrc
try_source "$HOME/.zshrc.local"
