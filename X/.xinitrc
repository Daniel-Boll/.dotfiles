#!/usr/bin/env bash

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Kill scripts if they are already started
if pgrep -x dunst; then
	killall dunst
fi

if pgrep -x picom; then
	killall picom
fi

if pgrep -x sxhkd; then
	killall sxhkd
fi

xset b off

# Light
xbacklight -set 100 &

# Audio
pulseaudio --start &

# Keyboard
xset r rate 230 45
setxkbmap -layout us
# xmodmap ~/.Xmodmap

# Notification daemon
dunst &

# Keybinds
sxhkd &

"$HOME/scripts/bar.sh" onedark 2 &>/dev/null &

# Set slock
xset dpms 300 &
xss-lock \
	--notifier "dunstify 'xss-lock' 'Screen will be locked in 10 seconds'" -- slock &

exec dwm # 2>/dev/null
