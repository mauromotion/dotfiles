#!/bin/bash

# Kill already existing processes to avoid duplication
processes=(
	"picom"
	"trayer"
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
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
	--expand true --width 10 --transparent true --tint 0x5f5f5f --height 18 &
nitrogen --restore &
udiskie -a -n -t &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
pa-applet &
nm-applet &
nextcloud --background &
openrgb --startminimized &
xset b 100 &
~/.icc_color_profiles/load_icc_color_profiles.sh &
