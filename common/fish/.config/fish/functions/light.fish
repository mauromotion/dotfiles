function light -d "Set light theme"
  set -xU theme "light"

  # Kitty
  kitty @ set-colors -a "~/.local/share/nvim/lazy/zenbones.nvim/extras/kitty/zenbones_light.conf"

  # Alacritty
  cp -f ~/.dotfiles/common/alacritty/.config/alacritty/themes/zenbones-light-dim-alacritty-theme.toml \
     ~/.dotfiles/common/alacritty/.config/alacritty/themes/current-theme.toml
end
