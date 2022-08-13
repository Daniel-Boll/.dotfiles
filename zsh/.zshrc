#!/bin/zsh

CONF_DIR="$HOME/.zsh"
[ -f "$CONF_DIR/startup.zsh" ] && source "$CONF_DIR/startup.zsh"

for conf in $(/usr/bin/ls $CONF_DIR | grep -v 'startup'); do
	source "${CONF_DIR}/${conf}"
done

unset CONF_DIR
unset conf

# pnpm
export PNPM_HOME="/home/danielboll/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
