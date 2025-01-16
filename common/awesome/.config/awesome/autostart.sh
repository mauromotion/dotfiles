#!/bin/bash

# Kill already existing processes to avoid duplication
processes=(
	# "fastcompmgr"
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
# fastcompmgr -o 0.4 -r 12 -c -C &
nitrogen --restore &
udiskie -a -n -t &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
pa-applet &
nm-applet &
nextcloud --background &
openrgb --startminimized &
xset b 100 &
~/.icc_color_profiles/load_icc_color_profiles.sh &
xinput set-prop 14 297 -0.800000 # SlimBlade Pro
xinput set-prop 16 297 -0.800000 # Viper Ultimate
xinput set-prop 19 297 -0.800000 # Viper Ultimate
xinput set-prop 27 297 -0.800000 # Viper Ultimate
