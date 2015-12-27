# Copyright (c) 2015, Maarten de Vries and Maurice Bos
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Authors: Maarten de Vries <maarten@de-vri.es>, Maurice Bos <m-ou.se@m-ou.se>



# # git-prompt-path
#
# Display git information next to every path component in your prompt.
#
# Example output:
#
#     ~/src/project(master+2)/foo*/bar/baz+%/submodule(release-1.2=)%/fizz/buzz
#
# Note how the branch names of both the project and the submodule are
# visible, and how the state of the index and worktree is visible at every
# directory.
#
# The status symbols are the same as used by `__git_ps1` from [`git-prompt.sh`][1]:
#
#  - `+` Changes in index.
#  - `*` Changes in working tree.
#  - `%` Untracked files.
#
# ## Usage examples
#
# First source both [`git-prompt.sh`][1] from git/contrib,
# and `git-prompt-path.sh` from this repository:
#
#     source ~/.../git-prompt.sh
#     source ~/.../git-prompt-path.sh
#
# And then for `zsh`:
#
#     PROMPT='$(git_prompt_path)$ '
#
#
# Or for `bash`:
#
#     function update_ps1 { PS1="$(git_prompt_path)\$ " }
#     PROMPT_COMMAND=update_ps1
#
#
# These will use the default colours. To use it without colour, call
# `git_prompt_path` with a format string without colour codes:
#   `$(git_prompt_path "%s%s")`
#
# Alternatively, to use your own colours, put them in the format string:
#   `$(git_prompt_path "...%s...%s...")...`
# Make sure to surround the colour codes with the right escape sequences for
# your shell. (`[` and `\]` for bash, `%{` and `%}` for zsh. Note that the `%`s need to
# be escaped inside the format string with another `%`.)
#
# [1]: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh



# Usage: git_prompt_path [$format [$path]]
# Print a path with git information next to each component of the path.
#
# Each component of $path will be printed along with some git status information
# according to the printf format string $format.
#
# The format string can contain two positional parameters: the path component,
# and the git information (in that order).
#
# __git_ps1 is must be defined when this function is invoked.
function git_prompt_path {
	local format="$1"
	local reset=''
	local p="$2"

	# Set a default format string with colours and make sure we reset the colour.
	if [[ -z "$format" ]]; then
		if [[ -n "$ZSH_VERSION" ]]; then
			format='%%{\e[34m%%}%s%%{\e[33m%%}%s%%{\e[35m%%}'
			reset='%{\e[39m%}'
		else
			format=$'\\[\e[34m\\]%s\\[\e[33m\\]%s\\[\e[35m\\]'
			reset=$'\[\e[39m\]'
		fi
	fi

	# Set the default path.
	if [[ -z "$p" ]]; then
		if [[ -n "$ZSH_VERSION" ]]; then
			# Default p to what zsh would show for %~ in PS1.
			p=$(print -P '%~')
		else
			# Default p to PWD with HOME shortened to ~.
			p="$PWD"
			[[ "${p:0:${#HOME}+1}" = "$HOME/" || "$p" == "$HOME" ]] && p="~${p:${#HOME}}"
		fi
	fi

	# Strip the trailing slash, if any.
	[[ "$p" != "/" ]] && p="${p%/}"

	local result=''
	local exclude=''
	# Iterate over the path components from right to left.
	while true; do
		local name="${p##*/}"
		local info=''

		# Expand a tilde at the start of the path.
		[[ -n "$ZSH_VERSION" ]] && local pp=${~p} || local pp="${p/#~/$HOME}"

		# Show the full __git_ps1 in the root of a repository.
		if [[ -e "${pp}/.git" ]]; then
			info="$(cd ${ZSH_VERSION+-q} "${pp}" &&
				GIT_PS1_SHOWDIRTYSTATE= GIT_PS1_SHOWUNTRACKEDFILES= __git_ps1 "(%s)")"
			# Shorten "(master u+1)" to "(master+1)".
			info="${info/ u/}"
		fi

		# Show short git status.
		echo "git status --porcelain \"$pp\" \"$exclude\" 2>/dev/null" > /tmp/a
		info="$info$(
			st=$'\n'"$(git -C "$pp" status --porcelain . "$exclude" 2>/dev/null)"
			[[ "$st" =~ [$'\n'].[A-Z] ]] && echo -n '*';
			[[ "$st" =~ [$'\n'][A-Z]  ]] && echo -n '+';
			[[ "$st" =~ [$'\n'][?]    ]] && echo -n "%${ZSH_VERSION+%}";
		)"

		# Prepend the result to using the format string.
		[[ -n "$result" || -z "$name" ]] && result="/$result"
		result="$(printf "$format" "$name" "$info")$result"

		# Ignore already reported changes in the next iteration.
		exclude=":(exclude)$name"

		# Pop the last path component, or break if we're at '/' or something without any slash.
		[[ "$p" = '/' ]] && break
		local next="${p%/*}"
		[[ "$next" = "$p" ]] && break
		p="${next:-/}"
	done

	echo -n "$result$reset"
}
