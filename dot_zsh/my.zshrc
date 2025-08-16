export EDITOR=hx
eval "$(mise activate zsh)"
export SLUMBER_CONFIG_PATH=~/.config/slumber/config.yml

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias taskexport='task export | jq "sort_by(.uuid)"'
