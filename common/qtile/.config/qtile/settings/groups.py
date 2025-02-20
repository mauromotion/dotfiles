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

# Groups (workspaces)
# groups = [Group(i) for i in "123456789"]
groups = [
    Group("1"),
    Group("2", matches=[Match(wm_class="thunderbird")]),
    Group("3", matches=[Match(wm_class="firefox-developer-edition")]),
    Group(
        "4",
        matches=[
            Match(wm_class=re.compile(r"^(telegram\-desktop|signal\-desktop|discord)$"))
        ],
    ),
    Group("5", matches=[Match(wm_class="logseq")]),
    Group("6", Match(wm_class=re.compile(r"^(freetube|jellyfinmediaplayer)$"))),
    Group("7", matches=[Match(wm_class="steam")], layout="floating"),
    Group("8"),
    Group("9"),
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
            ),
        ],
    ),
)
