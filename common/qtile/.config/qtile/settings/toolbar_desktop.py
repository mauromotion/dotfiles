def toolbar_desktop():
    return [
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
            format="{icon} {main_temp:.1f}°{units_temperature} ({main_feels_like:.0f}°{units_temperature})",
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
    ]
