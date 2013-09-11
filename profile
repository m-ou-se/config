config_dir=$(dirname "$(readlink -f .profile)")

function prepend_bin_dir {
	[ -d "$1" ] && PATH="$1:$PATH"
}

prepend_bin_dir "$HOME/bin"
prepend_bin_dir "$config_dir/bin"
prepend_bin_dir "$HOME/.local/bin"
prepend_bin_dir "$HOME/.cabal/bin"

[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"

# vi: ft=sh
