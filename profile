config_dir="$HOME/.config/config_dir"

[ -d "$HOME/bin"                 ] && PATH="$HOME/bin:$PATH"
[ -d "$config_dir/bin"           ] && PATH="$config_dir/bin:$PATH"
[ -d "$HOME/.local/bin"          ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.cabal/bin"          ] && PATH="$HOME/.cabal/bin:$PATH"
[ -d "$HOME/.gem/ruby/2.0.0/bin" ] && PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"

[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"

export _JAVA_AWT_WM_NONREPARENTING=1

if command -v gpg-agent > /dev/null; then
	gpg-agent --daemon --enable-ssh-support > /dev/null 2>&1
	export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi

# vi: ft=sh
