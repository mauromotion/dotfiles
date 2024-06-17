#!/bin/sh

# manage sessions

# default session
session=${1:-i3}

case $session in
dwm)
	while true; do
		$HOME/dwm/autostart.sh &
		dwm 2>~/.dwm.log
	done
	;;
i3)
	exec i3
	;;
	# no known session, try to run it as command
*)
	exec $1
	;;
esac

# Autostart applictations
# if [ $session == "dwm" ]; then
# 	~/dwm/autostart.sh &
# fi
