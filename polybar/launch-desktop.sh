#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default con***REMOVED***g location ~/.con***REMOVED***g/polybar/con***REMOVED***g.ini
polybar desktop_primary_Nord 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
