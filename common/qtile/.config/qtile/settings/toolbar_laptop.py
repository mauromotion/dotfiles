from libqtile import bar, widget
from libqtile.lazy import lazy

# Custom "display kernel" widget
kernel_widget = widget.GenPollText(
    func=lambda: subprocess.getoutput("~/.scripts/kernel.sh"),
    update_interval=1200,
    fmt="{}",
    foreground="#5DE4C7",
)


def laptop_toolbar():
    return bar.Bar(
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
                update_interval=400,
                display_format=" {updates}",
                no_update_string="",
                colour_have_updates="#FFFAC2",
                mouse_callbacks={
                    "Button1": lazy.spawn(
                        "wezterm start -- sh -c 'yay -Syu --devel; sleep 5'"
                    )
                },
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
