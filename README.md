```
------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
------------------------------------------------------
```

# Dotfiles

This repository contains all the configuration files for the Arch Linux installations on both my desktop and laptop computers.

## Installation

1. Install git and stow:
   `sudo pacman -S git stow`

2. Clone this repository into home:
   `git clone git@github.com:mauromotion/dotfiles.git ~/.dotfiles`

3. Move inside the just created directory:
   `cd ~/.dotfiles`

4. Stow specific configurations as needed either for desktop, laptop, or common:
   `stow -d desktop -t ~ i3 polybar`
   `stow -d laptop -t ~ i3 polybar`
   `stow -d common -t ~ nvim wezterm zsh`
