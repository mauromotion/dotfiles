import json
import os


def load_theme():
    theme = "tokyonight"  # WARN: Available themes: catppuccin, gruvbox, nord, poimandres, tokyonight

    theme_file_path = os.path.expanduser(f"~/.config/qtile/themes/{theme}.json")

    with open(theme_file_path) as f:
        return json.load(f)


if __name__ == "settings.theme":
    colors = load_theme()
