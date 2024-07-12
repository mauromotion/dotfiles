#!/bin/bash

# Get the volume from pamixer
percentage=$(pamixer --get-volume-human)

# Create an empty icon variable
icon=""

# Show a different icon for each volume level
if [[ "$percentage" == *"muted"* ]]; then
	icon="" # Mute
	percentage="muted"
else
	# Convert the string into an integer
	vol_int=$(echo $percentage | grep -oP '[0-9]+')

	if [ "$vol_int" -eq 0 ]; then
		icon="" # Mute
	elif [ "$vol_int" -gt 0 ] && [ "$vol_int" -le 20 ]; then
		icon="" # Low volume
	elif [ "$vol_int" -gt 20 ] && [ "$vol_int" -le 60 ]; then
		icon="" # Medium volume
	elif [ "$vol_int" -gt 60 ]; then
		icon="" # High volume
	fi
fi

# Print the output
echo -e "${icon}  ${percentage}"
