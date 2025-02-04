#!/bin/bash

batt=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage)
batt_int=$(echo $batt | grep -oP '[0-9]+')
state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}')

icon=""

if [ "$state" == charging ]; then
	icon="󰂄"
elif [ "$batt_int" -eq 100 ]; then
	icon="󰁹"
elif [ "$state" == discharging ]; then
	if [ "$batt_int" -eq 100 ]; then
		icon="󰁹"
	elif [ "$batt_int" -gt 90 ] && [ "$batt_int" -lt 100 ]; then
		icon="󰂂"
	elif [ "$batt_int" -gt 80 ] && [ "$batt_int" -lt 90 ]; then
		icon="󰂁"
	elif [ "$batt_int" -gt 70 ] && [ "$batt_int" -lt 80 ]; then
		icon="󰂀"
	elif [ "$batt_int" -gt 60 ] && [ "$batt_int" -lt 70 ]; then
		icon="󰁿"
	elif [ "$batt_int" -gt 50 ] && [ "$batt_int" -lt 60 ]; then
		icon="󰁾"
	elif [ "$batt_int" -gt 40 ] && [ "$batt_int" -lt 50 ]; then
		icon="󰁽"
	elif [ "$batt_int" -gt 30 ] && [ "$batt_int" -lt 40 ]; then
		icon="󰁼"
	elif [ "$batt_int" -gt 20 ] && [ "$batt_int" -lt 30 ]; then
		icon="󰁻"
	elif [ "$batt_int" -gt 10 ] && [ "$batt_int" -lt 20 ]; then
		icon="󰁻"
	elif [ "$batt_int" -gt 10 ] && [ "$batt_int" -lt 0 ]; then
		icon="󰁺"
	fi
fi

echo -e "${icon} ${batt_int}%"
