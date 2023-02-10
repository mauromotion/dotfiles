
-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")
-- Custom Local Library
-- local titlebar = require("anybox.titlebar")

local _M = {***REMOVED***
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local clientkeys = gears.table.join(
    awful.key({ modkey,           ***REMOVED***, "f",
      function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      {description = "toggle fullscreen", group = "client"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "n",
      function (c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
      end ,
      {description = "minimize", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "m",
      function (c)
        c.maximized = not c.maximized
        c:raise()
      end ,
      {description = "(un)maximize", group = "client"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "m",
      function (c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
      end ,
      {description = "(un)maximize vertically", group = "client"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "m",
      function (c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
      end ,
      {description = "(un)maximize horizontally", group = "client"***REMOVED***)
  )

  return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)
