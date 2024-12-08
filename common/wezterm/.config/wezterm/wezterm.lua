local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Focus follows mouse
config.pane_focus_follows_mouse = true

--------* UI *--------

-- Colorscheme
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.94

-- Font
-- config.font = wezterm.font("JetBrainsMono NF", { weight = "DemiBold" })
config.font = wezterm.font("Maple Mono NF", { weight = "DemiBold" })
-- config.font = wezterm.font("IosevkaTerm Nerd Font", { weight = "DemiBold" })
-- config.font = wezterm.font("FiraCode Nerd Font", { weight = "DemiBold" })
config.font_size = 12
config.freetype_load_flags = "DEFAULT"

-- Tabs
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = true
config.tab_max_width = 50

-- Config fancy tab bar
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
	-- font = wezterm.font({ family = "JetBrainsMono NF", weight = "Bold" }),
	font = wezterm.font({ family = "Maple Mono NF", weight = "Bold" }),
	font_size = 10.5,
	active_titlebar_bg = "rgb(36, 39, 58, 0)",
	inactive_titlebar_bg = "rgb(36, 39, 58, 0)",
}

-- Set max fps
config.max_fps = 144

-- Alert bell
config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 100,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 100,
}
config.colors = {
	visual_bell = "#363A4F",
	split = "#B4BEFE",
	-- Fancy tab bar colors
	tab_bar = {
		active_tab = {
			fg_color = "#24273A",
			bg_color = "#C6A0F6",
		},
		inactive_tab = {
			bg_color = "rgb(0 0 0 0)",
			fg_color = "#CAD3F5",
		},
		inactive_tab_hover = {
			bg_color = "#363A4F",
			fg_color = "#B4BEFE",
		},
	},
}

--------* Keybindings *--------
config.disable_default_key_bindings = true

config.keys = {
	-- Panes
	{
		key = "Enter",
		mods = "CTRL|SHIFT|ALT",
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
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PaneSelect({ mode = "SwapWithActiveKeepFocus" }),
	},
	-- Cycle to the next pane
	{
		key = "}",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivatePaneDirection = "Next" }),
	},

	-- Cycle to the previous pane
	{
		key = "{",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivatePaneDirection = "Prev" }),
	},

	-- Rotate panes
	{
		key = "b",
		mods = "CTRL|SHIFT",
		action = wezterm.action.RotatePanes("CounterClockwise"),
	},
	{ key = "n", mods = "CTRL|SHIFT", action = wezterm.action.RotatePanes("Clockwise") },

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
		action = wezterm.action.PromptInputLine({
			description = "Enter a new title for the current tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
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
		mods = "CTRL",
		action = wezterm.action.ActivateTab(0),
	},
	{
		key = "2",
		mods = "CTRL",
		action = wezterm.action.ActivateTab(1),
	},
	{
		key = "3",
		mods = "CTRL",
		action = wezterm.action.ActivateTab(2),
	},
	{
		key = "4",
		mods = "CTRL",
		action = wezterm.action.ActivateTab(3),
	},
	{
		key = "5",
		mods = "CTRL",
		action = wezterm.action.ActivateTab(4),
	},
	{
		key = "6",
		mods = "CTRL",
		action = wezterm.action.ActivateTab(5),
	},
	{
		key = "7",
		mods = "CTRL",
		action = wezterm.action.ActivateTab(6),
	},
	{
		key = "8",
		mods = "CTRL",
		action = wezterm.action.ActivateTab(7),
	},
	{
		key = "9",
		mods = "CTRL",
		action = wezterm.action.ActivateTab(8),
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
	-- Command palette
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateCommandPalette,
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
