
-- {{{ Required libraries
local gears = require("gears")
local awful = require("awful")
-- ***REMOVED******REMOVED******REMOVED***

local _M = {***REMOVED***

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  -- Create a wibox for each screen and add it
  local taglist_buttons = gears.table.join(
    awful.button({ ***REMOVED***, 1, function(t) t:view_only() end),
    awful.button({ modkey ***REMOVED***, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({ ***REMOVED***, 3, awful.tag.viewtoggle),
    awful.button({ modkey ***REMOVED***, 3, function(t)
      if client.focus then
       client.focus:toggle_tag(t)
      end
    end),
    awful.button({ ***REMOVED***, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ ***REMOVED***, 5, function(t) awful.tag.viewprev(t.screen) end)
  )

  return taglist_buttons
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)
