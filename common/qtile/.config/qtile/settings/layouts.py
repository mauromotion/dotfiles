# -----------------------------------
# -- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
# -- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
# -- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
# -------- * Qtile Layouts * --------
# -----------------------------------

from libqtile import layout
from libqtile.config import Match

# Layouts configs
layouts = [
    layout.Columns(
        border_normal="#303340",
        border_focus="#5DE4C7",
        border_focus_stack=["#89DDFF", "#ADD7FF"],
        border_width=1,
        initial_ratio=1.3,
        # margin=6,
        # margin_on_single=25,
    ),
    layout.Max(),
    layout.TreeTab(
        place_right=True,
        active_bg="#5DE4C7",
        active_fg="#1B1E28",
        inactive_bg="#303340",
        bg_color="#1B1E28",
    ),
    layout.Floating(border_focus="#5DE4C7", border_normal="#1B1E28"),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(
    #     border_normal="#303340",
    #     border_focus="#5DE4C7",
    #     border_focus_stack=["#89DDFF", "#ADD7FF"],
    #     border_width=1,
    #     # margin=6,
    # ),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Stack(num_stacks=2),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# Layouts rules
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="Grim Dawn"),  # Match by window title
        Match(wm_class="steam_app_219990"),  # Match by Steam App ID (Grim Dawn)
        Match(wm_class="gpick"),
        Match(wm_class="Lxappearance"),
        Match(wm_class="Qalculate-gtk"),
        Match(wm_class="Tor Browser"),
        Match(wm_class="steam"),
        Match(wm_class="Galculator"),
        Match(wm_class="Gimp"),
        Match(wm_class="Pavucontrol"),
        Match(wm_class="Viewnior"),
        Match(wm_class="mpv"),
        Match(wm_class="Nitrogen"),
        Match(wm_class="org.cryptomator.launcher.Cryptomator$MainApp"),
        Match(wm_class="vlc"),
    ],
    border_focus="#5DE4C7",
    border_normal="#1B1E28",
    border_width=1,
)
