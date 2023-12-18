#!/bin/zsh

CONF_DIR="$HOME/.zsh"
[ -f "$CONF_DIR/startup.zsh" ] && source "$CONF_DIR/startup.zsh"

for conf in $(/usr/bin/ls $CONF_DIR | grep -v 'startup'); do
	source "${CONF_DIR}/${conf}"
done

unset CONF_DIR
unset conf

# bun completions
[ -s "/home/danielboll/.bun/_bun" ] && source "/home/danielboll/.bun/_bun"
