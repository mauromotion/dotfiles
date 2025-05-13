# -----------------------------------
# -- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
# -- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
# -- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
# -------- * Qtile Layouts * --------
# -----------------------------------

from libqtile import layout
from libqtile.config import Match
from .theme import colors

# Layouts configs
layouts = [
    layout.Columns(
        border_normal=colors["background"][0],
        border_focus=colors["foreground"][0],
        border_focus_stack=[colors["cyan"][0], colors["blue"][0]],
        border_width=1,
        # initial_ratio=1.618,
        # margin=6,
        # margin_on_single=25,
    ),
    layout.Max(),
    layout.TreeTab(
        place_right=True,
        active_bg=colors["accent1"][0],
        active_fg=colors["background"][0],
        inactive_bg=colors["background"][1],
        bg_color=colors["background"][0],
    ),
    layout.Floating(
        border_focus=colors["accent1"][0], border_normal=colors["background"][0]
    ),
    # layout.Matrix(),
    # layout.MonadTall(
    #     border_normal=colors["background"][1],
    #     border_focus=colors["accent1"][0],
    #     border_focus_stack=[colors["cyan"][0], colors["blue"][0]],
    #     border_width=1,
    #     # margin=6,
    # ),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Stack(num_stacks=2),
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
    border_focus=colors["foreground"][0],
    border_normal=colors["background"][0],
    border_width=1,
)
