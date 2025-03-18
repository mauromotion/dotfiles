# -----------------------------------
# -- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
# -- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
# -- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
# ------- * Qtile Groups * ----------
# -----------------------------------

import re
from libqtile.config import Group, Match, ScratchPad, DropDown, Key
from libqtile.lazy import lazy

from .keys import keys, mod, terminal
from .icons import dots, font_awesome, mixed_geo, moons, numbers, text

# Choose the icons set to use
icons = numbers

# Groups (workspaces)
label_style = ["font_awesome", "numbers", "circles", "mixed_geo", "moons"]

groups = [
    Group("1", label=icons[0]),
    Group("2", label=icons[1], matches=[Match(wm_class="org.gnome.Evolution")]),
    Group(
        "3",
        label=icons[2],
    ),
    Group(
        "4",
        label=icons[3],
        matches=[Match(wm_class=re.compile(r"^(telegram\-desktop|signal|discord)$"))],
    ),
    Group("5", label=icons[4], matches=[Match(wm_class="logseq")]),
    Group(
        "6",
        Match(wm_class=re.compile(r"^(freetube|jellyfinmediaplayer)$")),
        label=icons[5],
    ),
    Group("7", label=icons[6], matches=[Match(wm_class="steam")], layout="floating"),
    Group("8", label=icons[7]),
    Group("9", label=icons[8]),
]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(toggle=True),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# Add a scratchpad terminal
groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term",
                terminal,
                opacity=0.9,
                width=0.8,
                height=0.6,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "updates",
                "alacritty sh -c 'yay -Syu --devel; sleep 5'",
                opacity=0.9,
                width=0.8,
                height=0.6,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "weather",
                "mousam",
                opacity=0.9,
                width=0.5,
                height=0.6,
                x=0.5,
            ),
            DropDown(
                "calendar",
                # "wezterm start --class CalcurseTerminal -- sh -c 'calcurse'",
                "gnome-calendar",
                # match=Match(wm_class=["CalcurseTerminal"]),
                opacity=0.9,
                width=0.5,
                height=0.6,
                x=0.5,
            ),
        ],
    ),
)
