local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

--------* UI *--------

-- Colorscheme
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "nordfox"
config.window_background_opacity = 1

-- Font
config.font = wezterm.font("JetBrainsMono NF", {})
-- config.font = wezterm.font("FiraCode Nerd Font", {})
config.font_size = 12
config.freetype_load_flags = "NO_HINTING"

-- Tabs
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Alert bell
config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 100,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 100,
}
config.colors = {
	visual_bell = "#4c566a",
}

--------* Keybindings *--------
config.disable_default_key_bindings = true

config.keys = {
	-- Panes
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "Enter",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "z",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- Quick Select
	{
		key = "Space",
		mods = "CTRL|SHIFT",
		action = wezterm.action.QuickSelect,
	},
	-- Activate copy mode
	{
		key = "x",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateCopyMode,
	},
	-- Clipboard
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	-- Font size
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "+",
		mods = "CTRL|SHIFT",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "0",
		mods = "CTRL",
		action = wezterm.action.ResetFontSize,
	},
	-- Tabs
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "t",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "Tab",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "1",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(0),
	},
	{
		key = "2",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(1),
	},
	{
		key = "3",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(2),
	},
	{
		key = "4",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(3),
	},
	{
		key = "5",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(4),
	},
	{
		key = "6",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(5),
	},
	{
		key = "7",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(6),
	},
	{
		key = "8",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(7),
	},
	{
		key = "9",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(7),
	},
	-- Search
	{
		key = "f",
		mods = "CTRL|SHIFT",
		action = wezterm.action.Search({ CaseSensitiveString = "" }),
	},
	-- Scrollback
	{
		key = "PageUp",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollByPage(-1),
	},
	{
		key = "PageDown",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollByPage(1),
	},
	{
		key = "Home",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ClearScrollback("ScrollbackOnly"),
	},
}

-- Zen-mode plugin integration in Neovim --
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
