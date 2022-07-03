#!/usr/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Kill scripts if they are already started
if pgrep -x dunst; then
    killall dunst
fi

# Light
xbacklight -set 100 &

# Set monitor profile
$HOME/scripts/automonitor # 2>/dev/null

# Audio
pulseaudio --start &

# Keyboard
xset r rate 230 45
xmodmap ~/.Xmodmap

# Notification daemon
dunst &

# Set wallpaper
$HOME/scripts/feh-set-bg # 2>/dev/null
# $HOME/scripts/dwmbar # 2>/dev/null
$HOME/scripts/bar.sh onedark 2&>/dev/null &

# Set slock
xset dpms 300 &
xss-lock \
  --notifier "dunstify 'xss-lock' 'Screen will be locked in 10 seconds'" -- slock &

exec dwm # 2>/dev/null
