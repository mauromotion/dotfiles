-- Standard awesome library
local awful = require("awful")

local _M = {***REMOVED***

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  local tags = {***REMOVED***

  awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    tags[s] = awful.tag(
      { "1", "2", "3", "4", "5", "6", "7", "8", "9" ***REMOVED***, s, RC.layouts[1]
    )
  end)

  return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)

