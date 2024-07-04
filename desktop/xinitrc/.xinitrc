#!/bin/sh

## Manage sessions ##

# Define the default session
session=${1:-i3}

# Launch requested session
case $session in
dwm)
	while true; do
		# Launch script to autostart some services and programs
		$HOME/src/suckless/dwm/autostart.sh &
		# Launch dwm, and in case of errors log them in a file
		dwm 2>~/.dwm.log
	done
	;;
i3)
	# Launch i3
	exec i3
	;;
xmonad)
	# Launch script to autostart some services and programs
	# $HOME/.config/xmonad/autostart.sh
	# Launch Xmonad
	exec xmonad
	;;
	# no known session, try to run it as command
*)
	# Launch default session (i3)
	exec $1
	;;
esac
