local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Configuration
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "Everforest Dark (Hard)"
config.font = wezterm.font("Maple Mono NF")
config.font_size = 11
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.93

return config
