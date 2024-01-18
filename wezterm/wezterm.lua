local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Configuration
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 12
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.92

-- For zen-mode plugin integration in Neovim
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
