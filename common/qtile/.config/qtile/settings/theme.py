import json
import os

""" _Available themes_: 
    doom-one
    catppuccin, 
    everforest,
    gruvbox-material-dark, 
    gruvbox-material-light, 
    material-lighter,
    neutral,
    nord, 
    poimandres, 
    qogir-light,
    tokyonight,
    zenwritten-dark
"""


def load_theme():
    theme = "neutral"

    theme_file_path = os.path.expanduser(f"~/.config/qtile/themes/{theme}.json")

    with open(theme_file_path) as f:
        return json.load(f)


if __name__ == "settings.theme":
    colors = load_theme()
