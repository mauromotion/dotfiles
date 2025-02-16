# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
import os
import socket
import subprocess

from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# from libqtile.utils import guess_terminal


# Autostart
@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.expanduser("~/.config/qtile/autostart.sh")])


# Variables
hostname = socket.gethostname()
mod = "mod4"
terminal = "wezterm"  # guess_terminal()
browser = "firefox"
file_explorer = "thunar"

# Keybindings
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "n", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "o", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "e", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "i", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "space", lazy.layout.flip()),
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
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "g", lazy.spawn("rofi -show combi"), desc="Rofi launcher"),
    Key(
        [mod],
        "p",
        lazy.spawn(
            'rofi -show power-menu -modi "power-menu:rofi-power-menu --choices=suspend/logout/lockscreen/reboot/shutdown"'
        ),
        desc="Rofi power menu",
    ),
    Key([mod, "shift"], "f", lazy.spawn(file_explorer), desc="Launch file explorer"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key(
        [mod, "shift"],
        "Tab",
        lazy.prev_layout(),
        desc="Toggle between layouts backwards",
    ),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "m", lazy.window.toggle_maximize(), desc="Toggle maximize"),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key(
        [mod, "shift"],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget",
    ),
    Key([mod, "control"], "b", lazy.hide_show_bar(), desc="Hides the bar"),
    Key(
        [mod, "control"],
        "0",
        lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Switch keyboard layout",
    ),
    Key([mod, "shift"], "z", lazy.spawn("flameshot gui"), desc="Take a screenshot"),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

# Groups (workspaces)
groups = [Group(i) for i in "123456789"]

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

# Layouts
layouts = [
    layout.Columns(
        border_normal="#303340",
        border_focus="#5DE4C7",
        border_focus_stack=["#89DDFF", "#ADD7FF"],
        border_width=1,
        # margin=6,
        # margin_on_single=25,
    ),
    layout.Max(),
    layout.Matrix(),
    layout.MonadTall(
        border_normal="#303340",
        border_focus="#5DE4C7",
        border_focus_stack=["#89DDFF", "#ADD7FF"],
        border_width=1,
        # margin=6,
    ),
    layout.MonadWide(),
    layout.RatioTile(),
    layout.TreeTab(
        place_right=True,
        active_bg="#5DE4C7",
        active_fg="#1B1E28",
        inactive_bg="#303340",
        bg_color="#1B1E28",
    ),
    layout.Floating(border_focus="#5DE4C7", border_normal="#1B1E28"),
    # layout.Bsp(),
    # layout.Stack(num_stacks=2),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# Widgets for the bar
widget_defaults = dict(
    font="Noto SansM Nerd Font Medium",
    fontsize=14,
    padding=8,
)
extension_defaults = widget_defaults.copy()

# Custom "display kernel" widget
kernel_widget = widget.GenPollText(
    func=lambda: subprocess.getoutput("~/.scripts/kernel.sh"),
    update_interval=1200,
    fmt="{}",
    foreground="#5DE4C7",
)

# Bar for desktop PC
if hostname == "eva-01":
    default_bar = bar.Bar(
        [
            widget.GroupBox(
                highlight_method="block",
                active="#5DE4C7",
                this_current_screen_border="#5DE4C7",
                rounded=False,
                block_highlight_text_color="#1B1E28",
                foreground="#303340",
            ),
            widget.Sep(foreground="#5DE4C7", linewidth=1),
            widget.CurrentLayout(foreground="#5DE4C7"),
            widget.Prompt(
                foreground="#FFFAC2",
            ),
            widget.Spacer(length=50),
            widget.WindowName(foreground="#A6ACCD"),
            widget.Spacer(length=50),
            widget.CheckUpdates(
                distro="Arch_yay",
                update_interval=600,
                display_format=" {updates}",
                no_update_string="",
                colour_have_updates="#FFFAC2",
            ),
            widget.Sep(foreground="#303340"),
            kernel_widget,
            widget.Sep(foreground="#303340"),
            widget.DF(
                format="󱛟 /root {uf}{m}|{r:.0f}%",
                partition="/",
                visible_on_warn=False,
                foreground="#767C9D",
            ),
            widget.DF(
                format="󱛟 /data {uf}{m}|{r:.0f}%",
                partition="/media/Linux_Data",
                visible_on_warn=False,
                foreground="#767C9D",
                warn_color="#D0679D",
            ),
            widget.Sep(foreground="#303340"),
            # widget.CPU(
            #     format=" {freq_current}GHz {load_percent}%", foreground="#5FB3A1"
            # ),
            widget.Memory(
                format=" {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}",
                measure_mem="G",
                foreground="#7390AA",
            ),
            widget.Sep(foreground="#303340"),
            widget.PulseVolume(
                unmute_format="  {volume}%",
                foreground="#ADD7FF",
                mute_format="  muted",
            ),
            widget.Sep(foreground="#303340"),
            widget.OpenWeather(
                location="Bromley,UK",
                format="{icon} {main_temp:.1f}°{units_temperature} | {main_feels_like:.0f}°{units_temperature}",
                update_interval=600,
                foreground="#5FB3A1",
            ),
            widget.Sep(foreground="#303340"),
            widget.KeyboardLayout(
                configured_keyboards=["gb", "gb colemak_dh"],
                display_map={"gb colemak_dh": "󰌌 gb_clmk-dh", "gb": "󰌌 gb"},
                foreground="#A6ACCD",
            ),
            widget.Sep(foreground="#303340"),
            widget.Systray(),
            widget.Sep(foreground="#303340"),
            widget.Clock(
                format="%b %d (%a) %H:%M",
                background="#5DE4C7",
                foreground="#1B1E28",
                # font="sans bold",
            ),
        ],
        24,
        background="#1B1E28",
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )

# Bar for Thinkpad laptop
elif hostname == "eva-03":
    default_bar = bar.Bar(
        [
            widget.GroupBox(
                highlight_method="line",
                active="#5DE4C7",
                this_current_screen_border="#5DE4C7",
                rounded=False,
                foreground="#303340",
            ),
            widget.Sep(foreground="#5DE4C7", linewidth=1),
            widget.CurrentLayout(foreground="#5DE4C7"),
            widget.Prompt(
                foreground="#FFFAC2",
            ),
            widget.Spacer(length=50),
            widget.WindowName(foreground="#A6ACCD"),
            widget.Spacer(length=50),
            widget.CheckUpdates(
                distro="Arch_yay",
                update_interval=600,
                display_format=" {updates}",
                no_update_string="",
                colour_have_updates="#FFFAC2",
            ),
            widget.Sep(foreground="#303340"),
            kernel_widget,
            widget.Sep(foreground="#303340"),
            widget.DF(
                format="󱛟 {p} ({uf}{m}|{r:.0f}%)",
                partition="/",
                visible_on_warn=False,
                foreground="#767C9D",
            ),
            widget.Sep(foreground="#303340"),
            widget.Memory(
                format=" {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}",
                measure_mem="G",
                foreground="#7390AA",
            ),
            widget.Sep(foreground="#303340"),
            widget.PulseVolume(
                unmute_format="  {volume}%",
                foreground="#ADD7FF",
                mute_format="  muted",
            ),
            widget.Sep(foreground="#303340"),
            widget.Backlight(
                backlight_name="intel_backlight",
                format="󰃠 {percent:2.0%}",
                foreground="#E4F0FB",
            ),
            widget.Sep(foreground="#303340"),
            widget.Battery(
                foreground="#FFFAC2",
                format="{char} {percent:2.0%}",
                charge_char="󰢝",
                discharge_char="󰁿",
                full_char="󰁹",
            ),
            widget.Sep(foreground="#303340"),
            widget.KeyboardLayout(
                configured_keyboards=["gb colemak_dh", "gb"],
                display_map={"gb colemak_dh": "󰌌 gb_clmk-dh", "gb": "󰌌 gb"},
                foreground="#A6ACCD",
            ),
            widget.Sep(foreground="#303340"),
            widget.Systray(),
            widget.Sep(foreground="#303340"),
            widget.Clock(
                format="%b %d (%a) %H:%M",
                background="#5DE4C7",
                foreground="#1B1E28",
            ),
        ],
        24,
        background="#1B1E28",
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )


screens = [
    Screen(top=default_bar),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
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
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"
