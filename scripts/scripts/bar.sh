#!/usr/bin/env bash

interval=0

# load colors
set -- $(<$HOME/scripts/bar_themes/$1)

black=$1
green=$2
white=$3
grey=$4
blue=$5
red=$6
darkblue=$7

cpu() {
	cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

	printf "^c$black^ ^b$green^ CPU"
	printf "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
	updates=$(checkupdates | wc -l)

	if [[ $updates == "0" ]]; then
		printf "^c$darkblue^ Fully Updated"
	else
		printf "^c$darkblue^  $updates"" updates"
	fi
}

battery() {
	get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
	charging_state=$(acpi | cut -d: -f2 | cut -d, -f1 | tr -d ' ')

	# Switch state for "Charging" "Discharging" "Full"
	if [ "$charging_state" = "Charging" ]; then
		printf "^c$blue^  $get_capacity %s" "%"
	elif [ "$charging_state" = "Discharging" ]; then
		printf "^c$red^  $get_capacity %s" "%"
	elif [ "$charging_state" = "Full" ]; then
		printf "^c$green^  $get_capacity %s" "%"
	fi
}

brightness() {
	current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
	max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
	# calculate the percentage of brightness
	brightness_percentage=$((current_brightness * 100 / max_brightness))

	printf "^c$red^  "
	printf "^c$red^%.0f %s \n" "$brightness_percentage" "%"
}

mem() {
	printf "^c$blue^^b$black^  "
	printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ " ;;
	down) printf "^c$black^ ^b$red^ " ;;
	esac
}

clock() {
	printf "^c$black^ ^b$darkblue^  "
	printf "^c$black^^b$blue^ $(date '+%H:%M')  "
}

volume() {
	volume=$(amixer get Master | grep -o "[0-9]*%")
	printf "^c$white^ ^b$grey^  "
	printf "^c$white^ $volume"
}

disk() {
	printf "^c$darkblue^ ^b$black^ "
	printf "^c$darkblue^ ^b$black^%s" $(df -h | awk '/^\/dev/ {print $3" / "$2}' | sed '2d')
}

kernel() {
	printf "^c$white^ $(uname -r)"
}

fetch_updates() {
	dunstify 'Fetching new results' '🕐 '
	updates=$(pkg_updates)
}

while true; do
	[ $(($interval % 3600)) = 1 ] && updates=$(pkg_updates)
	interval=$((interval + 1))

	trap "fetch_updates" SIGUSR1

	# sleep 1 && xsetroot -name "$(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
	sleep 1 && xsetroot -name "$updates $(kernel) $(battery) $(brightness)$(cpu) $(mem) $(wlan)$(disk) $(volume) $(clock)"
done
