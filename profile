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

add_path "$HOME/bin"
add_path "$config_dir/bin"
add_path "$HOME/.local/bin"
add_path "$HOME/.cabal/bin"
add_path "$HOME"/.gem/ruby/*/bin
add_path "$HOME/.npm-packages/bin"

if [ -d "$HOME/.npm-packages" ]; then
	export NODE_PATH="$HOME/.npm-packages/lib/node_modules"
fi

export EDITOR=vim
export PAGER=less
export MANPAGER=vimpager

export _JAVA_AWT_WM_NONREPARENTING=1

[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"

# vi: ft=sh
