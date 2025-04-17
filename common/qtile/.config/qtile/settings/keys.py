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
terminal = "alacritty"  # "wezterm start --always-new-process"
browser = "waterfox"
file_explorer = "nemo"


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
    # Switch between groups with meta-arrows
    # Key([mod], "left", lazy.screen.prev_group(), desc="Switch to previous group"),
    # Key([mod], "right", lazy.screen.next_group(), desc="Switch to next group"),
    # Switch between windows
    Key([mod], "n", lazy.layout.left(), desc="Move Focus Left"),
    Key([mod], "o", lazy.layout.right(), desc="Move Focus Right"),
    Key([mod], "e", lazy.layout.down(), desc="Move Focus Down"),
    Key([mod], "i", lazy.layout.up(), desc="Move Focus Up"),
    Key(
        [mod],
        "Tab",
        lazy.group.toscreen(toggle=True),
        desc="Toggle Between Last Two Selected Groups",
    ),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "control", "shift"],
        "n",
        lazy.layout.shuffle_left(),
        desc="Move Window to the Left",
    ),
    Key(
        [mod, "control", "shift"],
        "o",
        lazy.layout.shuffle_right(),
        desc="Move Window to the Right",
    ),
    Key(
        [mod, "control", "shift"],
        "e",
        lazy.layout.shuffle_down(),
        desc="Move Window Down",
    ),
    Key(
        [mod, "control", "shift"], "i", lazy.layout.shuffle_up(), desc="Move Window Up"
    ),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "shift"], "n", lazy.layout.grow_left(), desc="Grow Window to the Left"),
    Key([mod, "shift"], "o", lazy.layout.grow_right(), desc="Grow Window to the Right"),
    Key([mod, "shift"], "e", lazy.layout.grow_down(), desc="Grow Window Down"),
    Key([mod, "shift"], "i", lazy.layout.grow_up(), desc="Grow Window Up"),
    Key([mod], "0", lazy.layout.normalize(), desc="Reset All Window Sizes"),
    Key(
        [mod, "control"],
        "n",
        lazy.layout.swap_column_left(),
        desc="Swap Columns to the Left",
    ),
    Key(
        [mod, "control"],
        "o",
        lazy.layout.swap_column_right(),
        desc="Swap Columns to the Right",
    ),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle Between Split and Unsplit Sides of Stack",
    ),
    # Kill Windows
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill Focused Window"),
    # Toggle full screen
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle Fullscreen on the Focused Window",
    ),
    # Toggle Maximize
    Key([mod], "m", maximize_by_switching_layout(), desc="Toggle 'Maximize' Layout"),
    # Toggle floating
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle 'Floating' on the Focused Window",
    ),
    # Center floating window
    Key([mod], "c", lazy.window.center(), desc="Center Floating Window on Screen"),
    # ------ Launching Applications ------
    # Prompt
    Key(
        [mod, "shift"],
        "r",
        lazy.spawncmd(),
        desc="Spawn a Command Using a Prompt Widget",
    ),
    # Launcher
    Key([mod], "g", lazy.spawn("rofi -show drun"), desc="Launch Rofi Launcher"),
    # Power Menu
    Key(
        [mod],
        "p",
        lazy.spawn(
            'rofi -show power-menu -modi "power-menu:rofi-power-menu --choices=suspend/logout/lockscreen/reboot/shutdown"'
        ),
        desc="Launch Rofi Power Menu",
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
        desc="Launch Dmenu Launcher",
    ),
    # Terminal
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch Terminal"),
    # Browser
    Key([mod], "b", lazy.spawn(browser), desc="Launch Browser"),
    # File Explorer
    Key([mod, "shift"], "f", lazy.spawn(file_explorer), desc="Launch File Explorer"),
    # Toggle between different layouts
    Key([mod], "space", lazy.next_layout(), desc="Toggle Between Layouts"),
    Key(
        [mod, "shift"],
        "space",
        lazy.prev_layout(),
        desc="Toggle Between Layouts Backwards",
    ),
    # ScratchPad dropdown
    Key(
        [mod],
        "minus",
        lazy.group["scratchpad"].dropdown_toggle("term"),
        desc="Launch Terminal Scratchpad",
    ),
    Key(
        [mod, "shift"],
        "w",
        lazy.group["scratchpad"].dropdown_toggle("weather"),
        desc="Launch Weather Scratchpad",
    ),
    Key(
        [mod, "shift"],
        "c",
        lazy.group["scratchpad"].dropdown_toggle("calendar"),
        desc="Launch Calendar Scratchpad",
    ),
    # ------ System ------
    # Reload Qtile configuration
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload Qtile Config"),
    # Log out Qtile
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Hide/Show Qtile bar
    Key([mod, "control"], "b", lazy.hide_show_bar(), desc="Toggle Qtile Bar"),
    # Switch Keyboard Layouts
    Key(
        [mod, "control"],
        "0",
        lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Switch Keyboard Layout (Qwerty/Colemak-DH)",
    ),
    # Take a Screenshot
    Key([mod, "shift"], "z", lazy.spawn("flameshot gui"), desc="Take a Screenshot"),
    # Multimedia
    Key([mod], "period", lazy.spawn("playerctl play-pause"), desc="Play/Pause"),
    Key([mod], "slash", lazy.spawn("playerctl next"), desc="Play Next Track"),
    Key([mod], "comma", lazy.spawn("playerctl previous"), desc="Play Previous Track"),
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
