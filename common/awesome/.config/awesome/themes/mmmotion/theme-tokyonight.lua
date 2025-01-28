-----------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * AwesomeWM * --
-- --------------------------------
-- Tokyonight theme --
-----------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local home = os.getenv("HOME")
local assets_path = home .. "/.config/awesome/themes/mmmotion"

local theme = {}

theme.font = "Noto SansM Nerd Font Medium 12"
-- theme.font = "JetBrainsMono Nerd Font Medium 11.5"
-- theme.font = "FiraMono Nerd Font Medium 12"
-- theme.font = "GeistMono Nerd Font Medium 12"
-- theme.font = "Maple Mono NF Medium 12"

theme.bg_normal = "#1A1B26"
theme.bg_focus = "#292E42"
theme.bg_urgent = "#F7768E"
theme.bg_minimize = "#292E42"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#909BC9"
theme.fg_minimize = "#909BC9"
theme.fg_focus = "#C0CAF5"
theme.fg_urgent = "#C0CAF5"

theme.useless_gap = dpi(0)
theme.border_width = dpi(2)
theme.border_color_normal = "#1A1B26"
theme.border_color_active = "#292E42"
theme.border_color_marked = "#F7768E"
theme.notification_border_color = "#7AA2F7"
theme.notification_border_width = dpi(4)

-- Colors for the wibar
theme.yellow = "#E0AF68"
theme.blue = "#29B6D0"
theme.cyan = "#73DACA"
theme.pink = "#BB9AF7"
theme.red = "#F7768E"
theme.green = "#9ECE6A"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = assets_path .. "submenu.png"
theme.menu_height = dpi(30)
theme.menu_width = dpi(200)
-- theme.menu_font = "JetBrains Mono 14"

-- Hotkeys screen customization
theme.hotkeys_font = "JetBrains Mono 11"
theme.hotkeys_description_font = "JetBrains Mono 9"
theme.hotkeys_border_width = 2
theme.hotkeys_border_color = "#292E42"
theme.hotkeys_group_margin = 20
theme.hotkeys_margin = 20
theme.hotkeys_label_margin = 10

-- Titlebar icons
theme.titlebar_close_button_normal = assets_path .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus = assets_path .. "/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = assets_path .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = assets_path .. "/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = assets_path .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = assets_path .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = assets_path .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = assets_path .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = assets_path .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = assets_path .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = assets_path .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = assets_path .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = assets_path .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = assets_path .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = assets_path .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = assets_path .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = assets_path .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = assets_path .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = assets_path .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = assets_path .. "/titlebar/maximized_focus_active.png"

-- Layout icons
theme.layout_fairh = assets_path .. "/layouts/fairhw.png"
theme.layout_fairv = assets_path .. "/layouts/fairvw.png"
theme.layout_floating = assets_path .. "/layouts/floatingw.png"
theme.layout_magnifier = assets_path .. "/layouts/magnifierw.png"
theme.layout_max = assets_path .. "/layouts/maxw.png"
theme.layout_fullscreen = assets_path .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = assets_path .. "/layouts/tilebottomw.png"
theme.layout_tileleft = assets_path .. "/layouts/tileleftw.png"
theme.layout_tile = assets_path .. "/layouts/tilew.png"
theme.layout_tiletop = assets_path .. "/layouts/tiletopw.png"
theme.layout_spiral = assets_path .. "/layouts/spiralw.png"
theme.layout_dwindle = assets_path .. "/layouts/dwindlew.png"
theme.layout_cornernw = assets_path .. "/layouts/cornernww.png"
theme.layout_cornerne = assets_path .. "/layouts/cornernew.png"
theme.layout_cornersw = assets_path .. "/layouts/cornersww.png"
theme.layout_cornerse = assets_path .. "/layouts/cornersew.png"

-- Tags icons
theme.tag_icon_home_focused = assets_path .. "/taglist/tokyonight/focused_home.svg"
theme.tag_icon_home_unfocused = assets_path .. "/taglist/tokyonight/unfocused_home.svg"
theme.tag_icon_mail_focused = assets_path .. "/taglist/tokyonight/focused_mail.svg"
theme.tag_icon_mail_unfocused = assets_path .. "/taglist/tokyonight/unfocused_mail.svg"
theme.tag_icon_dev_focused = assets_path .. "/taglist/tokyonight/focused_dev.svg"
theme.tag_icon_dev_unfocused = assets_path .. "/taglist/tokyonight/unfocused_dev.svg"
theme.tag_icon_chat_focused = assets_path .. "/taglist/tokyonight/focused_chat.svg"
theme.tag_icon_chat_unfocused = assets_path .. "/taglist/tokyonight/unfocused_chat.svg"
theme.tag_icon_docs_focused = assets_path .. "/taglist/tokyonight/focused_docs.svg"
theme.tag_icon_docs_unfocused = assets_path .. "/taglist/tokyonight/unfocused_docs.svg"
theme.tag_icon_media_focused = assets_path .. "/taglist/tokyonight/focused_media.svg"
theme.tag_icon_media_unfocused = assets_path .. "/taglist/tokyonight/unfocused_media.svg"
theme.tag_icon_games_focused = assets_path .. "/taglist/tokyonight/focused_games.svg"
theme.tag_icon_games_unfocused = assets_path .. "/taglist/tokyonight/unfocused_games.svg"
theme.tag_icon_edit_focused = assets_path .. "/taglist/tokyonight/focused_edit.svg"
theme.tag_icon_edit_unfocused = assets_path .. "/taglist/tokyonight/unfocused_edit.svg"
theme.tag_icon_extra_focused = assets_path .. "/taglist/tokyonight/focused_extra.svg"
theme.tag_icon_extra_unfocused = assets_path .. "/taglist/tokyonight/unfocused_extra.svg"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Fluent-teal-dark"

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
	rnotification.append_rule({
		rule = { urgency = "critical" },
		properties = { bg = "#F7768E", fg = "#C0CAF5" },
	})
end)

return theme
