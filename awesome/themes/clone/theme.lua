
local awful = require("awful")
awful.util = require("awful.util")

theme_path = awful.util.getdir("con***REMOVED***g") .. "/themes/clone/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {***REMOVED***

do***REMOVED***le(theme_path .. "elements.lua")
do***REMOVED***le(theme_path .. "titlebar.lua")
do***REMOVED***le(theme_path .. "layouts.lua")
-- do***REMOVED***le(theme_path .. "icons.lua")


theme.wallpaper          = theme_path .. "background.jpg"
theme.awesome_icon       = theme_path .. "launcher/logo20_kali_black.png"
theme.awesome_subicon    = theme_path .. "launcher/logo20_kali_black.png"

return theme


