#!/bin/bash

batt=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage)
batt_int=$(echo $batt | grep -oP '[0-9]+')

icon=""

echo -e "  ${batt_int}%"
