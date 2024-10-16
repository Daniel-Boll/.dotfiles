#!/usr/bin/env bash

LID_STATE=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}')

if [ "$LID_STATE" = "closed" ]; then
  xrandr --output eDP-1 --off
else
  xrandr --output eDP-1 --auto
fi
