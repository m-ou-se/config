config_dir=$(dirname "$(readlink -f .profile)")

[ -d "$HOME/bin"        ] && PATH="$HOME/bin:$PATH"
[ -d "$config_dir/bin"  ] && PATH="$config_dir/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"

# vi: ft=sh
