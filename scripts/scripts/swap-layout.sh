#!/usr/bin/env bash

# Swap the current keyboard layout between the
# default us and the international us layout

# Grep for the variant
variant=$(setxkbmap -query | grep -oP 'variant:\s*\K\w+')

# If the variant is empty, set it to international
if [ -z "$variant" ]; then
	notify-send "Keyboard Layout" "Switched to US International 🇧🇷"
	setxkbmap us -variant intl
else
	notify-send "Keyboard Layout" "Switched to US 🇺🇸"
	setxkbmap us
fi
