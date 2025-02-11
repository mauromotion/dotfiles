-----------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * AwesomeWM * --
-- --------------------------------
-- Nord theme --
-----------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local naughty = require("naughty")

local home = os.getenv("HOME")
local assets_path = home .. "/.config/awesome/themes/mmmotion"

local theme = {}

theme.font = "Noto SansM Nerd Font Medium 12"
-- theme.font = "JetBrainsMono Nerd Font Medium 11.5"
-- theme.font = "FiraMono Nerd Font Medium 12"
-- theme.font = "GeistMono Nerd Font Medium 12"
-- theme.font = "Maple Mono NF Medium 12"

-- Main colors
theme.fg_normal = "#616e88"
theme.bg_normal = "#2e3440"

theme.fg_focus = "#d8dee9"
theme.bg_focus = "#3b4252"

theme.fg_urgent = "#2e3440"
theme.bg_urgent = "#88c0d0"

theme.fg_minimize = "#d8dee9"
theme.bg_minimize = "#4c566a"

theme.bg_systray = theme.bg_normal

-- Gaps
theme.useless_gap = dpi(0)

-- Windows' border
theme.border_color_normal = "#2e3440"
theme.border_color_active = "#3b4252"
theme.border_color_marked = "#b48ead"
theme.border_width = dpi(2)

-- Notification
theme.notification_fg = "#eceff4"
theme.notification_bg = "#2e3440"
theme.notification_border_color = "#88c0d0"
theme.notification_border_width = dpi(4)
naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(32)
naughty.config.defaults.timeout = 10
naughty.config.defaults.hover_timeout = 300
naughty.config.defaults.title = "System Notification Title"
naughty.config.defaults.margin = dpi(16)
naughty.config.defaults.border_width = 2
naughty.config.defaults.position = "top_right"

-- Colors for the toolbar
theme.yellow = "#ebcb8b"
theme.blue = "#81a1c1"
theme.cyan = "#88c0d0"
theme.pink = "#b48ead"
theme.red = "#bf616a"
theme.green = "#a3be8c"

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
theme.menu_submenu_icon = assets_path .. "/submenu.png"
theme.menu_height = dpi(30)
theme.menu_width = dpi(200)
-- theme.menu_font = "JetBrains Mono 14"

-- Hotkeys screen customization
theme.hotkeys_font = "JetBrains Mono 11"
theme.hotkeys_description_font = "JetBrains Mono 9"
theme.hotkeys_border_width = 2
theme.hotkeys_border_color = "#303340"
theme.hotkeys_group_margin = 20
theme.hotkeys_margin = 20
theme.hotkeys_label_margin = 10

-- Layout icons
local gcolor = require("gears.color")

theme.layout_fairh = gcolor.recolor_image(assets_path .. "/layouts/fairhw.png", theme.fg_normal)
theme.layout_fairv = gcolor.recolor_image(assets_path .. "/layouts/fairvw.png", theme.fg_normal)
theme.layout_floating = gcolor.recolor_image(assets_path .. "/layouts/floatingw.png", theme.fg_normal)
theme.layout_magnifier = gcolor.recolor_image(assets_path .. "/layouts/magnifierw.png", theme.fg_normal)
theme.layout_max = gcolor.recolor_image(assets_path .. "/layouts/maxw.png", theme.fg_normal)
theme.layout_fullscreen = gcolor.recolor_image(assets_path .. "/layouts/fullscreenw.png", theme.fg_normal)
theme.layout_tilebottom = gcolor.recolor_image(assets_path .. "/layouts/tilebottomw.png", theme.fg_normal)
theme.layout_tileleft = gcolor.recolor_image(assets_path .. "/layouts/tileleftw.png", theme.fg_normal)
theme.layout_tile = gcolor.recolor_image(assets_path .. "/layouts/tilew.png", theme.fg_normal)
theme.layout_tiletop = gcolor.recolor_image(assets_path .. "/layouts/tiletopw.png", theme.fg_normal)
theme.layout_spiral = gcolor.recolor_image(assets_path .. "/layouts/spiralw.png", theme.fg_normal)
theme.layout_dwindle = gcolor.recolor_image(assets_path .. "/layouts/dwindlew.png", theme.fg_normal)
theme.layout_cornernw = gcolor.recolor_image(assets_path .. "/layouts/cornernww.png", theme.fg_normal)
theme.layout_cornerne = gcolor.recolor_image(assets_path .. "/layouts/cornernew.png", theme.fg_normal)
theme.layout_cornersw = gcolor.recolor_image(assets_path .. "/layouts/cornersww.png", theme.fg_normal)
theme.layout_cornerse = gcolor.recolor_image(assets_path .. "/layouts/cornersew.png", theme.fg_normal)

-- Tags icons
theme.tag_icon_home_focused = assets_path .. "/taglist/nord/focused_home.svg"
theme.tag_icon_home_unfocused = assets_path .. "/taglist/nord/unfocused_home.svg"
theme.tag_icon_mail_focused = assets_path .. "/taglist/nord/focused_mail.svg"
theme.tag_icon_mail_unfocused = assets_path .. "/taglist/nord/unfocused_mail.svg"
theme.tag_icon_dev_focused = assets_path .. "/taglist/nord/focused_dev.svg"
theme.tag_icon_dev_unfocused = assets_path .. "/taglist/nord/unfocused_dev.svg"
theme.tag_icon_chat_focused = assets_path .. "/taglist/nord/focused_chat.svg"
theme.tag_icon_chat_unfocused = assets_path .. "/taglist/nord/unfocused_chat.svg"
theme.tag_icon_docs_focused = assets_path .. "/taglist/nord/focused_docs.svg"
theme.tag_icon_docs_unfocused = assets_path .. "/taglist/nord/unfocused_docs.svg"
theme.tag_icon_media_focused = assets_path .. "/taglist/nord/focused_media.svg"
theme.tag_icon_media_unfocused = assets_path .. "/taglist/nord/unfocused_media.svg"
theme.tag_icon_games_focused = assets_path .. "/taglist/nord/focused_games.svg"
theme.tag_icon_games_unfocused = assets_path .. "/taglist/nord/unfocused_games.svg"
theme.tag_icon_edit_focused = assets_path .. "/taglist/nord/focused_edit.svg"
theme.tag_icon_edit_unfocused = assets_path .. "/taglist/nord/unfocused_edit.svg"
theme.tag_icon_extra_focused = assets_path .. "/taglist/nord/focused_extra.svg"
theme.tag_icon_extra_unfocused = assets_path .. "/taglist/nord/unfocused_extra.svg"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Fluent-teal-dark"

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
	rnotification.append_rule({
		rule = { urgency = "critical" },
		properties = { bg = "#bf616a", fg = "#eceff4" },
	})
end)

return theme
