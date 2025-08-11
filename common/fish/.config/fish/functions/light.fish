function light -d "Set light theme"
  set -xU theme "light"

  # Kitty
  kitty @ set-colors -a "~/.config/kitty/themes/zenbones/zenbones_light_dim.conf"

  # Alacritty
  cp -f ~/.dotfiles/common/alacritty/.config/alacritty/themes/zenbones-light-dim-alacritty-theme.toml \
     ~/.dotfiles/common/alacritty/.config/alacritty/themes/current-theme.toml
end
