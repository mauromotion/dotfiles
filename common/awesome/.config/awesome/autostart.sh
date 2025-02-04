#!/bin/bash

# Kill already existing processes to avoid duplication
processes=(
	# "fastcompmgr"
	"picom"
	"udiskie"
	"polkit-gnome-au"
	"nextcloud"
	"openrgb"
	"xbindkeys"
)

for proc in "${processes[@]}"; do
	pids=$(pgrep "$proc")

	if [ -n "$pids" ]; then
		kill $pids
	fi
done

# Autostart programs
picom -b &
# fastcompmgr -o 0.4 -r 12 -c -C &
nitrogen --restore &
udiskie -a -n -t &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nextcloud --background &
openrgb --startminimized &
xset b 100 &
xbindkeys &
~/.icc_color_profiles/load_icc_color_profiles.sh &
