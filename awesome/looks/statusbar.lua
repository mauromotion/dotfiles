
-- Standard awesome library
local gears = require("gears")
local awful     = require("awful")

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local looks = {
  wallpaper = require("looks.wallpaper"),
  taglist   = require("looks.taglist"),
  tasklist  = require("looks.tasklist")
***REMOVED***

local taglist_buttons  = looks.taglist()
local tasklist_buttons = looks.tasklist()

local _M = {***REMOVED***

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ ***REMOVED***, 1, function () awful.layout.inc( 1) end),
    awful.button({ ***REMOVED***, 3, function () awful.layout.inc(-1) end),
    awful.button({ ***REMOVED***, 4, function () awful.layout.inc( 1) end),
    awful.button({ ***REMOVED***, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
***REMOVED***lter  = awful.widget.taglist.***REMOVED***lter.all,
    buttons = taglist_buttons
  ***REMOVED***

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
***REMOVED***lter  = awful.widget.tasklist.***REMOVED***lter.currenttags,
    buttons = tasklist_buttons
  ***REMOVED***

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s ***REMOVED***)

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.***REMOVED***xed.horizontal,
      RC.launcher,
      s.mytaglist,
      s.mypromptbox,
    ***REMOVED***,
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.***REMOVED***xed.horizontal,
      mykeyboardlayout,
      wibox.widget.systray(),
      mytextclock,
      s.mylayoutbox,
    ***REMOVED***,
  ***REMOVED***
end)
-- ***REMOVED******REMOVED******REMOVED***
