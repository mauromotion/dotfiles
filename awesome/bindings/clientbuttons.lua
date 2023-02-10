
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {***REMOVED***
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local clientbuttons = gears.table.join(
    awful.button({ ***REMOVED***, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true***REMOVED***)
    end),
    awful.button({ modkey ***REMOVED***, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true***REMOVED***)
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey ***REMOVED***, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true***REMOVED***)
        awful.mouse.client.resize(c)
    end)
  )

  return clientbuttons
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)
