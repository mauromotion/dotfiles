#!/bin/bash

# Kill already existing processes to avoid duplication
processes=(
	# "fastcompmgr"
	"picom"
	"udiskie"
	"nm-applet"
	"blueman-applet"
	"polkit-gnome-au"
	"nextcloud"
	"openrgb"
	"xbindkeys"
	"xautolock"
	"xidlehook"
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
nm-applet &
blueman-applet &
nextcloud --background &
openrgb --startminimized &
xset b 100 &
xbindkeys &
# xautolock -time 10 -locker "betterlockscreen -l dimblur" -detectsleep &
xidlehook --not-when-fullscreen --not-when-audio --timer 600 "betterlockscreen -l dimblur" "" &
~/.icc_color_profiles/load_icc_color_profiles.sh &
