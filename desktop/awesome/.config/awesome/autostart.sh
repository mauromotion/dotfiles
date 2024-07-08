#!/bin/bash

# Kill already existing processes to avoid duplication
processes=(
	"picom"
	"udiskie"
	"polkit-gnome-au"
	"pa-applet"
	"nm-applet"
	"nextcloud"
	"openrgb"
)

for proc in "${processes[@]}"; do
	pids=$(pgrep "$proc")

	if [ -n "$pids" ]; then
		kill $pids
	fi
done

# Autostart programs
picom -b &
nitrogen --restore &
udiskie -a -n -t &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
pa-applet &
nm-applet &
nextcloud --background &
openrgb --startminimized &
xset b 100 &
~/.icc_color_profiles/load_icc_color_profiles.sh &
