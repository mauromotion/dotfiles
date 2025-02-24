import subprocess

from libqtile import bar, widget
from libqtile.lazy import lazy

from .theme import colors

# Custom "display kernel" widget
kernel_widget = widget.GenPollText(
    func=lambda: subprocess.getoutput("~/.scripts/kernel.sh"),
    update_interval=1200,
    fmt="{}",
    foreground=colors["accent1"][0],
)


def laptop_toolbar():
    return bar.Bar(
        [
            widget.GroupBox(
                highlight_method="block",
                active=colors["accent1"][0],
                this_current_screen_border=colors["accent1"][0],
                rounded=False,
                block_highlight_text_color=colors["background"][0],
                foreground=colors["black"][1],
                inactive=colors["black"][1],
            ),
            widget.Sep(foreground=colors["accent1"][0], linewidth=1),
            # widget.TextBox(
            #     "ς", foreground=colors["accent1"][0], font="NotoSansM Nerd Font 16"
            # ),
            widget.CurrentLayout(foreground=colors["accent1"][0]),
            widget.Sep(foreground=colors["accent1"][0], linewidth=1),
            widget.Prompt(
                foreground=colors["accent2"][0],
            ),
            widget.Spacer(length=50),
            widget.WindowName(foreground=colors["foreground"][0]),
            widget.Spacer(length=50),
            widget.CheckUpdates(
                distro="Arch_checkupdates",
                update_interval=400,
                display_format=" {updates}",
                no_update_string="",
                colour_have_updates=colors["accent2"][0],
                mouse_callbacks={
                    "Button1": lazy.group["scratchpad"].dropdown_toggle("updates")
                },
            ),
            widget.Sep(foreground=colors["background"][1]),
            # kernel_widget,
            # widget.Sep(foreground=colors["background"][1]),
            widget.DF(
                format="󱛟 {p} ({uf}{m}|{r:.0f}%)",
                partition="/",
                visible_on_warn=False,
                foreground=colors["foreground"][0],
            ),
            widget.Sep(foreground=colors["background"][1]),
            widget.Memory(
                format=" {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}",
                measure_mem="G",
                foreground=colors["foreground"][0],
            ),
            widget.Sep(foreground=colors["background"][1]),
            widget.PulseVolume(
                unmute_format="  {volume}%",
                foreground=colors["blue"][0],
                mute_format="  muted",
            ),
            widget.Sep(foreground=colors["background"][1]),
            widget.Backlight(
                backlight_name="intel_backlight",
                format="󰃠 {percent:2.0%}",
                foreground=colors["foreground"][1],
            ),
            widget.Sep(foreground=colors["background"][1]),
            widget.Battery(
                foreground=colors["accent2"][0],
                format="{char} {percent:2.0%}",
                charge_char="󰢝",
                discharge_char="󰁿",
                full_char="󰁹",
            ),
            widget.Sep(foreground=colors["background"][1]),
            widget.OpenWeather(
                location="Bromley,UK",
                format="{icon} {main_temp:.1f}°{units_temperature}",
                update_interval=600,
                foreground=colors["green"][0],
                mouse_callbacks={
                    "Button1": lazy.group["scratchpad"].dropdown_toggle("weather")
                },
            ),
            widget.Sep(foreground=colors["background"][1]),
            widget.KeyboardLayout(
                configured_keyboards=["gb colemak_dh", "gb"],
                display_map={"gb colemak_dh": "󰌌 gb_clmk-dh", "gb": "󰌌 gb"},
                foreground=colors["foreground"][0],
            ),
            widget.Sep(foreground=colors["background"][1]),
            widget.Systray(),
            widget.Sep(foreground=colors["background"][1]),
            widget.Clock(
                format="%b %d (%a) %H:%M",
                background=colors["accent1"][0],
                foreground=colors["background"][0],
                mouse_callbacks={
                    "Button1": lazy.group["scratchpad"].dropdown_toggle("calendar")
                },
            ),
        ],
        24,
        background=colors["background"][0],
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )
