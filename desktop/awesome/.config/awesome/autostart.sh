#!/bin/bash

# Check for already existing processes to avoid duplication
run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

# Start every time
nitrogen --restore &

# Start only once
run "picom -b"
run "udiskie -a -n -t"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "pa-applet"
run "nm-applet"
run "nextcloud --background"
run "openrgb --startminimized"
run "xset b 100 &"

# Load color profiles either for my desktop monitors or my laptop
if [ $(hostnamectl --static) == "eva-01" ]; then

	dispwin -d1 "$HOME/.config/i3/color-profiles/icc/Dell_S2721DGF.icm"
	sleep 1
	dispwin -d2 "$HOME/.config/i3/color-profiles/icc/Dell_U2713HM.icm"

elif [ $(hostnamectl --static) == "eva-02" ]; then

	dispwin "$HOME/.config/i3/color-profiles/icc/Gigabyte_Aero_15X.icm"

fi
