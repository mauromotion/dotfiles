function dark -d "Set dark theme"
  set -xU theme "dark"

  # Kitty
  kitty @ set-colors -a "~/.local/share/nvim/lazy/zenbones.nvim/extras/kitty/zenbones_dark.conf"

  # Alacritty
  cp -f ~/.dotfiles/common/alacritty/.config/alacritty/themes/zenbones-dark-alacritty-theme.toml \
     ~/.dotfiles/common/alacritty/.config/alacritty/themes/current-theme.toml
end
