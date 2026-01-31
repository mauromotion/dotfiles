#!/bin/bash

get_host() {
  hostnamectl --static
}

HOSTNAME=$(get_host)

# Kill already existing processes to avoid duplication
processes=(
  "blueman-applet"
  "caffeine-ng"
  "clipit"
  "dunst"
  "kanata"
  "nextcloud"
  "nm-applet"
  "openrgb"
  "picom"
  "polkit-gnome-au"
  "syncthingtray"
  "udiskie"
  "xbindkeys"
  "xidlehook"
)

for proc in "${processes[@]}"; do
  pids=$(pgrep "$proc")

  if [ -n "$pids" ]; then
    echo "$pids" | xargs kill
  fi
done

# Autostart programs

if [[ "$HOSTNAME" == "eva-01" ]]; then

  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
  caffeine &
  clipit &
  dunst -b &
  nextcloud --background &
  nitrogen --restore &
  nm-applet &
  openrgb --startminimized &
  picom -b &
  protonvpn connect --p2p &
  syncthingtray-qt6 &
  udiskie -a -n -t &
  xbindkeys &
  xidlehook --not-when-fullscreen --timer 600 "betterlockscreen -l dimblur" "" --timer 3600 "systemctl suspend" "" &
  xset -dpms & # Disable DPMS
  xset b 100 & # system bell volume
  xset s off & # Disable screen blanking
  ~/.icc_color_profiles/load_icc_color_profiles.sh &

elif [[ "$HOSTNAME" == "eva-03" ]]; then

  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
  blueman-applet &
  caffeine &
  clipit &
  dunst -b &
  kanata -c ~/.config/kanata/kanata-full-colemak_dh.kbd &
  nextcloud --background &
  nitrogen --restore &
  nm-applet &
  picom -b &
  syncthingtray-qt6 &
  udiskie -a -n -t &
  xbindkeys &
  xidlehook --not-when-fullscreen --timer 600 "betterlockscreen -l dimblur" "" --timer 3600 "systemctl suspend" "" &
  ~/.icc_color_profiles/load_icc_color_profiles.sh &
fi
