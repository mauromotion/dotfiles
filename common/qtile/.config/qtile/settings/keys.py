# -----------------------------------
# -- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
# -- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
# -- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
# ----- * Qtile Keybindings * -------
# -----------------------------------

from libqtile import extension as ext
from libqtile.config import Key
from libqtile.lazy import lazy

from .theme import colors

mod = "mod4"
terminal = "kitty"  # "wezterm start --always-new-process"
browser = "firefox"
file_explorer = "thunar"


# Toggle Max and Columns layouts to maximize a window correctly
@lazy.function
def maximize_by_switching_layout(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == "columns":
        qtile.current_group.layout = "max"
    elif current_layout_name == "max":
        qtile.current_group.layout = "columns"


keys = [
    # ------ Windows Management ------
    # Switch between windows
    Key([mod], "n", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "o", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "e", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "i", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to next window"),
    Key(
        [mod, "shift"],
        "space",
        lazy.layout.previous(),
        desc="Move window focuse to previous window",
    ),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "control", "shift"],
        "n",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "control", "shift"],
        "o",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key(
        [mod, "control", "shift"],
        "e",
        lazy.layout.shuffle_down(),
        desc="Move window down",
    ),
    Key(
        [mod, "control", "shift"], "i", lazy.layout.shuffle_up(), desc="Move window up"
    ),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "shift"], "n", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "shift"], "o", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "e", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "shift"], "i", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "0", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "control"], "n", lazy.layout.swap_column_left()),
    Key([mod, "control"], "o", lazy.layout.swap_column_right()),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Kill Windows
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    # Toggle full screen
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    # Toggle Maximize
    Key([mod], "m", maximize_by_switching_layout(), desc="Toggle maximize"),
    # Toggle floating
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    # Center floating window
    Key([mod], "c", lazy.window.center(), desc="Center floating window"),
    # ------ Launching Applications ------
    # Prompt
    Key(
        [mod, "shift"],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget",
    ),
    # Launcher
    Key([mod], "g", lazy.spawn("rofi -show combi"), desc="Rofi launcher"),
    # Power Menu
    Key(
        [mod],
        "p",
        lazy.spawn(
            'rofi -show power-menu -modi "power-menu:rofi-power-menu --choices=suspend/logout/lockscreen/reboot/shutdown"'
        ),
        desc="Rofi power menu",
    ),
    # Dmenu
    Key(
        [mod],
        "d",
        lazy.run_extension(
            ext.DmenuRun(
                dmenu_prompt=">",
                dmenu_font="Noto Sans Mono",
                background=colors["background"][0],
                foreground=colors["foreground"][0],
                selected_background=colors["accent1"][0],
                selected_foreground=colors["background"][0],
            )
        ),
    ),
    # Terminal
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Browser
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    # File Explorer
    Key([mod, "shift"], "f", lazy.spawn(file_explorer), desc="Launch file explorer"),
    # Toggle between different layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key(
        [mod, "shift"],
        "Tab",
        lazy.prev_layout(),
        desc="Toggle between layouts backwards",
    ),
    # ScratchPad dropdown
    Key([mod], "minus", lazy.group["scratchpad"].dropdown_toggle("term")),
    Key([mod, "shift"], "w", lazy.group["scratchpad"].dropdown_toggle("weather")),
    Key([mod, "shift"], "c", lazy.group["scratchpad"].dropdown_toggle("calendar")),
    # ------ System ------
    # Reload Qtile configuration
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    # Log out Qtile
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Hide/Show Qtile bar
    Key([mod, "control"], "b", lazy.hide_show_bar(), desc="Hides the bar"),
    # Switch Keyboard Layouts
    Key(
        [mod, "control"],
        "0",
        lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Switch keyboard layout",
    ),
    # Take a Screenshot
    Key([mod, "shift"], "z", lazy.spawn("flameshot gui"), desc="Take a screenshot"),
]

# ------ Wayland ------

# # Add key bindings to switch VTs in Wayland.
# # We can't check qtile.core.name in default config as it is loaded before qtile is started
# # We therefore defer the check until the key binding is run by using .when(func=...)
# for vt in range(1, 8):
#     keys.append(
#         Key(
#             ["control", "mod1"],
#             f"f{vt}",
#             lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
#             desc=f"Switch to VT{vt}",
#         )
#     )
