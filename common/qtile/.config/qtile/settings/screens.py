# -----------------------------------
# -- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
# -- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
# -- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
# -------- * Qtile Screens * --------
# -----------------------------------

import socket
import subprocess

from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy
from .toolbar_desktop import desktop_toolbar
from .toolbar_laptop import laptop_toolbar

# Get the machine hostname
hostname = socket.gethostname()

widget_defaults = dict(
    font="NotoSansM Nerd Font Medium",
    fontsize=15,
    padding=6,
)
extension_defaults = widget_defaults.copy()

# Bar for desktop PC
if hostname == "eva-01":
    toolbar = desktop_toolbar()

# Bar for Thinkpad laptop
elif hostname == "eva-03":
    toolbar = laptop_toolbar()


screens = [
    Screen(top=toolbar),
]
