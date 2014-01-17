config_dir=$(dirname "$(readlink -f .profile)")

[ -d "$HOME/bin"                 ] && PATH="$HOME/bin:$PATH"
[ -d "$config_dir/bin"           ] && PATH="$config_dir/bin:$PATH"
[ -d "$HOME/.local/bin"          ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.cabal/bin"          ] && PATH="$HOME/.cabal/bin:$PATH"
[ -d "$HOME/.gem/ruby/2.0.0/bin" ] && PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"

[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"

# vi: ft=sh
