-- Standard awesome library
local awful     = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local _M = {***REMOVED***

-- reading
-- https://awesomewm.org/apidoc/libraries/awful.rules.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get(clientkeys, clientbuttons)
  local rules = {

    -- All clients will match this rule.
    { rule = { ***REMOVED***,
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus     = awful.client.focus.***REMOVED***lter,
        raise     = true,
        keys      = clientkeys,
        buttons   = clientbuttons,
        screen    = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
      ***REMOVED***
    ***REMOVED***,

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        ***REMOVED***,
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a ***REMOVED***xed window size to avoid ***REMOVED***ngerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"***REMOVED***,

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match de***REMOVED***ned rules here.
        name = {
          "Event Tester",  -- xev.
        ***REMOVED***,
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "Con***REMOVED***gManager",  -- Thunderbird's about:con***REMOVED***g.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        ***REMOVED***
      ***REMOVED***,
      properties = {
        floating = true
      ***REMOVED***
    ***REMOVED***,

    -- Add titlebars to normal clients and dialogs
    { rule_any = {
        type = { "normal", "dialog" ***REMOVED***
      ***REMOVED***,
      properties = {
        titlebars_enabled = true
      ***REMOVED***
    ***REMOVED***,

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" ***REMOVED***,
    --   properties = { screen = 1, tag = "2" ***REMOVED*** ***REMOVED***,

  ***REMOVED***

  return rules
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)

