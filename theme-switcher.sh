#!/bin/bash

read -p "Enter theme (gruvbox / nord / everforest): " theme

if [ -z "$theme" ]; then
	echo "Error: no theme provided" >&2
	exit 1
fi

if [ "$theme" != "gruvbox" ] && [ "$theme" != "nord" ] && [ "$theme" != "everforest" ]; then
	echo "Invalid theme"
	exit 1
fi

# Check if the directories already exist, if not create them

if [ ! -d "$HOME/.config/i3/" ]; then
	mkdir "$HOME/.config/i3/"
elif [ ! -d "$HOME/.config/polybar/" ]; then
	mkdir "$HOME/.config/polybar/"
elif [ ! -d "$HOME/.config/dunst/" ]; then
	mkdir "$HOME/.config/dunst/"
elif [ ! -d "$HOME/.config/rofi/" ]; then
	mkdir "$HOME/.config/rofi/"
else
	## Symlink i3 config
	rm -f "$HOME/.config/i3/config"
	ln -svf "$HOME/.dotfiles/i3/${theme}-desktop-i3-config" "$HOME/.config/i3/config"

	## Symlink polybar config
	rm -f "$HOME/.config/polybar/config.ini"
	ln -svf "$HOME/.dotfiles/polybar/${theme}-config.ini" "$HOME/.config/polybar/config.ini"

	## Symlink dunst
	rm -f "$HOME/.config/dunst/dunstrc"
	ln -svf "$HOME/.dotfiles/dunst/${theme}-dunstrc" "$HOME/.config/dunst/dunstrc"

	## Symlink rofi
	rm -f "$HOME/.config/rofi/config-Mauro.rasi"
	ln -svf "$HOME/.dotfiles/rofi/${theme}-Mauro.rasi" "$HOME/.config/rofi/config-Mauro.rasi"
fi

# Reload polybar
sh ~/.config/polybar/launch.sh

# Reload i3
i3-msg reload

# Switch Firefox theme
# Load Sidebery custom CSS
# Switch Thunderbird theme
# Switch Alacritty colorscheme and font
# Switch GTK theme (lxappearance)
# Switch Neovim colorscheme
# Switch .Xresources
# Switch btop theme
# Switch TauonMusicBox theme
# Switch BetterDiscord theme
# Switch Telegram theme
