#!/bin/bash

# Get the volume from wpctl
vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')"

# Convert the volume from float to percentage
percentage=$(printf "%.0f\n" $(echo "$vol * 100" | bc))

# Convert the string into an integer
vol_int=$(echo $percentage | grep -oP '[0-9]+')

# Create an empty icon variable
icon=""

# Show a different icon for each volume level
if [ "$vol_int" -eq 0 ]; then
	icon="" # Mute
elif [ "$vol_int" -gt 0 ] && [ "$vol_int" -le 20 ]; then
	icon="" # Low volume
elif [ "$vol_int" -gt 20 ] && [ "$vol_int" -le 60 ]; then
	icon="" # Medium volume
elif [ "$vol_int" -gt 60 ]; then
	icon="" # High volume
fi

# Print the output
echo -e "${icon}  ${percentage}%"
