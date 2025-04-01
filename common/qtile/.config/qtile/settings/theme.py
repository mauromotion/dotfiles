import json
import os

""" _Available themes_: 
    catppuccin, 
    gruvbox-material-dark, 
    gruvbox-material-light, 
    nord, 
    poimandres, 
    tokyonight
"""


def load_theme():
    theme = "gruvbox-material-light"

    theme_file_path = os.path.expanduser(f"~/.config/qtile/themes/{theme}.json")

    with open(theme_file_path) as f:
        return json.load(f)


if __name__ == "settings.theme":
    colors = load_theme()
