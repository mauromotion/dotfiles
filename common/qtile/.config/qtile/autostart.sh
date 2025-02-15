#!/bin/bash

get_host() {
	hostnamectl --static
}

HOSTNAME=$(get_host)

# Kill already existing processes to avoid duplication
processes=(
	"dunst"
	"picom"
	"udiskie"
	"nm-applet"
	"blueman-applet"
	"polkit-gnome-au"
	"nextcloud"
	"openrgb"
	"xbindkeys"
	"xidlehook"
	"kanata"
)

for proc in "${processes[@]}"; do
	pids=$(pgrep "$proc")

	if [ -n "$pids" ]; then
		echo "$pids" | xargs kill
	fi
done

# Autostart programs

if [[ "$HOSTNAME" == "eva-01" ]]; then

	dunst -b &
	picom -b &
	nitrogen --restore &
	udiskie -a -n -t &
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	nm-applet &
	nextcloud --background &
	openrgb --startminimized &
	xset b 100 &
	xbindkeys &
	xidlehook --not-when-fullscreen --not-when-audio --timer 600 "betterlockscreen -l dimblur" "" --timer 3600 "systemctl suspend" "" &
	~/.icc_color_profiles/load_icc_color_profiles.sh &

elif [[ "$HOSTNAME" == "eva-03" ]]; then

	dunst -b &
	picom -b &
	nitrogen --restore &
	udiskie -a -n -t &
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	nm-applet &
	blueman-applet &
	nextcloud --background &
	openrgb --startminimized &
	xbindkeys &
	kanata -c ~/.config/kanata/kanata.kbd &
	xidlehook --not-when-fullscreen --not-when-audio --timer 600 "betterlockscreen -l dimblur" "" --timer 3600 "systemctl suspend" "" &
	~/.icc_color_profiles/load_icc_color_profiles.sh &
fi
