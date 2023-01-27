```
------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- https://github.com/mauromotion/dotfiles -----------
```
My dotfiles repo

These directories need to be symlinked from ~/.dotfiles to ~/.config with `ln -svf ~/.dotfiles/<DIR> ~/.config/`.

I will write a script later on. Example:

```
#!/bin/bash
dotfiles = (.fish)for file in "$.dotfiles[@]"; do
    ln -svf $file ~/.config
done
```
