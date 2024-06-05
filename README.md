```
------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- https://github.com/mauromotion/dotfiles -----------
```

# Dotfiles repository

This repository contains all the configuration files for my linux systems.

## Installation

1. Install git and stow:
   `sudo pacman -S git stow`

2. Clone this repository into home:
   `git clone git@github.com:mauromotion/dotfiles.git ~/.dotfiles`

3. Move inside the just created directory:
   `cd ~/.dotfiles`

4. Run stow for each needed configuration files and move on with your day:
   e.g. `stow nvim` `stow wezterm` `stow zsh`

5. For i3wm you have to choose between one of the two configurations based on the matching keyboard layout:
   `stow i3-qwerty` or `stow i3-colemak`
