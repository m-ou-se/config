config_dir="$HOME/.config/config_dir"

add_path() {
	for d in "$@"; do
		[ -d "$d" ] || continue
		case ":$PATH:" in
			*":$d:"*) ;;
			::) export PATH="$d" ;;
			*)  export PATH="$d:$PATH" ;;
		esac
	done
}

add_path "$config_dir/bin"
add_path "$HOME/.cabal/bin"
add_path "$HOME"/.gem/ruby/*/bin
add_path "$HOME"/.local/share/gem/ruby/*/bin
add_path "$HOME/.npm-packages/bin"
add_path "$HOME/.cargo/bin"
add_path "$HOME/.local/bin"
add_path "$HOME/bin"

if [ -d "$HOME/.npm-packages" ]; then
	export NODE_PATH="$HOME/.npm-packages/lib/node_modules"
fi

export EDITOR=vim
export PAGER=less
export MANPAGER=vimpager

export FZF_DEFAULT_COMMAND='rg --files --follow'

export _JAVA_AWT_WM_NONREPARENTING=1

[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"

[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# vi: ft=sh
