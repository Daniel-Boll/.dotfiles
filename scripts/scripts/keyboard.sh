#!/usr/bin/env bash

# Switch keyboard variants on Hyprland

if [[ -z $(hyprctl devices | grep "intl") ]]; then
  notify-send "🌍"
  hyprctl keyword input:kb_variant intl
else
  notify-send "🦅"
  hyprctl keyword input:kb_variant ' '
fi
