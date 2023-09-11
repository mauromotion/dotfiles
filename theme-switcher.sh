#!/bin/bash

read -p "Enter theme (gruvbox / nord): " theme

if [ -z "$theme" ]; then
	echo "Error: no theme provided" >&2
	exit 1
fi

if [ "$theme" != "gruvbox" ] && [ "$theme" != "nord" ]; then
	echo "Invalid theme"
	exit 1
fi

## Symlink i3 config
ln -svf "$HOME/.dotfiles/i3/${theme}-desktop-config" "$HOME/.config/i3/config"

## Symlink polybar config
ln -svf "$HOME/.dotfiles/polybar/${theme}-config.ini" "$HOME/.config/polybar/config.ini"

## Symlink dunst
ln -svf "$HOME/.dotfiles/dunst/${theme}-dunstrc" "$HOME/.config/dunst/dunstrc"

# Reload polybar
sh ~/.config/polybar/launch.sh

# Reload i3
i3-msg reload
