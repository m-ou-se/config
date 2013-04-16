config_dir=$(dirname "$(readlink -f .profile)")

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$config_dir/bin" ] ; then
    PATH="$config_dir/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
