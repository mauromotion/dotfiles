
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {***REMOVED***

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local globalbuttons = gears.table.join(
    awful.button({ ***REMOVED***, 3, function () RC.mainmenu:toggle() end),
    awful.button({ ***REMOVED***, 4, awful.tag.viewnext),
    awful.button({ ***REMOVED***, 5, awful.tag.viewprev)
  )

  return globalbuttons
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)
