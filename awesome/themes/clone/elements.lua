
local gmc = require("themes.clone.gmc")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

theme.font          = "BlexMono Nerd Font Medium 12" -- "Terminus 8" -- "Tamsyn 10" -- "Sans 8"
theme.taglist_font  = "Inconsolata Medium 9"

theme.bg_normal     = gmc.color['white']     .. "cc"
theme.bg_focus      = gmc.color['red300']    .. "cc"
theme.bg_urgent     = gmc.color['orange900'] .. "cc"
theme.bg_minimize   = gmc.color['grey500']   .. "cc"
theme.bg_systray    = gmc.color['grey100']   .. "cc"

theme.fg_normal     = gmc.color['black']
theme.fg_focus      = gmc.color['white']
theme.fg_urgent     = gmc.color['white']
theme.fg_minimize   = gmc.color['white']

theme.useless_gap   = dpi(6)
theme.border_width  = dpi(2)

theme.border_normal = gmc.color['blue500']   .. "cc"
theme.border_focus  = gmc.color['red300']    .. "cc"
theme.border_marked = gmc.color['orange500'] .. "cc"

-- There are other variable sets
-- overriding the default one when
-- de***REMOVED***ned, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_***REMOVED***nder_[color|timeout|animate_timeout|radius|factor]
-- Example:

theme.taglist_bg_focus = gmc.color['red500'] .. "cc"
--theme.taglist_bg_focus = "png:" .. theme_path .. "misc/copycat-holo/taglist_bg_focus.png"
theme.taglist_fg_focus = gmc.color['white']


theme.tasklist_bg_normal = gmc.color['white']    .. "88"
--theme.tasklist_bg_normal = "png:" .. theme_path .. "misc/copycat-holo/bg_focus.png"
theme.tasklist_bg_focus  = gmc.color['red300']   .. "88"
--theme.tasklist_bg_focus  = "png:" .. theme_path .. "misc/copycat-holo/bg_focus_noline.png"
theme.tasklist_fg_focus  = gmc.color['black']

theme.titlebar_bg_normal = gmc.color['white']   .. "cc"
theme.titlebar_bg_focus  = gmc.color['white']   .. "cc"
theme.titlebar_fg_focus  = gmc.color['black']   .. "cc"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, gmc.color['black']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, gmc.color['white']
)

-- Display the taglist squares

-- override
theme.taglist_squares_sel      = theme_path .. "taglist/clone/square_sel.png"
theme.taglist_squares_unsel    = theme_path .. "taglist/clone/square_unsel.png"

-- alternate override
-- theme.taglist_squares_sel   = theme_path .. "taglist/copycat-blackburn/square_sel.png"
-- theme.taglist_squares_unsel = theme_path .. "taglist/copycat-blackburn/square_unsel.png"
-- theme.taglist_squares_sel   = theme_path .. "taglist/copycat-zenburn/squarefz.png"
-- theme.taglist_squares_unsel = theme_path .. "taglist/copycat-zenburn/squareza.png"


-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon  = theme_path .. "misc/default/submenu.png"

theme.menu_height = 20      -- dpi(15)
theme.menu_width  = 180     -- dpi(100)
--theme.menu_context_height = 20

theme.menu_bg_normal = gmc.color['white']  .. "cc"
theme.menu_bg_focus  = gmc.color['red300'] .. "cc"
theme.menu_fg_focus  = gmc.color['black']

theme.menu_border_color = gmc.color['blue500'] .. "cc"
theme.menu_border_width = 1

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"
