```
------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- https://github.com/mauromotion/dotfiles -----------
```

# Dotfiles repository

This repository contains all the configuration files for the Arch Linux installation on my main desktop machine.

## Installation

1. Install git and stow:
   `sudo pacman -S git stow`

2. Clone this repository into home:
   `git clone -b arch-desktop git@github.com:mauromotion/dotfiles.git ~/.dotfiles`

3. Move inside the just created directory:
   `cd ~/.dotfiles`

4. Stow specific configurations as needed:
   `stow nvim` `stow wezterm` `stow zsh`

5. OR run stow and move on with your day:
   `stow .`

   > [!WARNING]
   > this is currently a work in progress, some symlinks won't work correctly (yet).
