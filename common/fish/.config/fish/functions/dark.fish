function dark -d "Set dark theme"
  set -xU theme "dark"

  # Kitty
  kitty @ set-colors -a "~/.config/kitty/themes/zenbones/zenbones_dark.conf"

  # Alacritty
  cp -f ~/.dotfiles/common/alacritty/.config/alacritty/themes/zenbones-dark-alacritty-theme.toml \
     ~/.dotfiles/common/alacritty/.config/alacritty/themes/current-theme.toml
end
