#!/bin/bash

# Export those functions

_fzf_smug_fzf() {
	fzf-tmux -p80%,60% -- \
		--layout=reverse --multi --height=50% --min-height=20 --border \
		--border-label-pos=2 \
		--color='header:italic:underline,label:blue' \
		--preview-window='right,50%,border-left' \
		--bind='ctrl-/:change-preview-window(down,50%,border-top|hidden|)' "$@"
}

_fzf_smug_list() {
	smug list |
		_fzf_smug_fzf --preview-window right,60% \
			--border-label '📽️ Projects' \
			--header $'CTRL-O/Enter (open project)\nCTRL-S (start project in background)\nCTRL-X (stop the project)\n\n' \
			--bind "ctrl-o:execute:smug start {} --attach" \
			--bind "enter:execute:smug start {} --attach" \
			--bind "ctrl-s:execute:smug start {}" \
			--bind "ctrl-x:execute:smug stop {}" \
			--preview 'bat ~/.config/smug/{}.yml' "$@"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	_fzf_smug_list "$@"
fi
