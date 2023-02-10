
-- {{{ Required libraries
local gears = require("gears")
local awful = require("awful")
-- ***REMOVED******REMOVED******REMOVED***

local _M = {***REMOVED***

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local tasklist_buttons = gears.table.join(
    awful.button({ ***REMOVED***, 1, function (c)
      if c == client.focus then
        c.minimized = true
  ***REMOVED***
        c:emit_signal(
          "request::activate",
          "tasklist",
          {raise = true***REMOVED***
        )
      end
    end),
    awful.button({ ***REMOVED***, 3, function()
      awful.menu.client_list({ theme = { width = 250 ***REMOVED*** ***REMOVED***)
    end),
    awful.button({ ***REMOVED***, 4, function ()
      awful.client.focus.byidx(1)
    end),
    awful.button({ ***REMOVED***, 5, function ()
      awful.client.focus.byidx(-1)
    end)
  )

  return tasklist_buttons
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)
