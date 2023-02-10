-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local M = {***REMOVED***  -- menu
local _M = {***REMOVED*** -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal

-- Variable de***REMOVED***nitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

M.awesome = {
  { "hotkeys", function() 
      hotkeys_popup.show_help(nil, awful.screen.focused()) 
    end ***REMOVED***,
  { "manual", terminal .. " -e man awesome" ***REMOVED***,
  { "edit con***REMOVED***g", editor_cmd .. " " .. awesome.conf***REMOVED***le ***REMOVED***,
  { "Terminal", terminal ***REMOVED***,
  { "Shutdown/Logout", "oblogout" ***REMOVED***,
  { "restart", awesome.restart ***REMOVED***,
  { "quit", function() awesome.quit() end ***REMOVED***
***REMOVED***

M.favorite = {
  { "caja", "caja" ***REMOVED***,
  { "thunar", "thunar" ***REMOVED***,
  { "geany", "geany" ***REMOVED***,
  { "clementine", "clementine" ***REMOVED***,
  { "***REMOVED***refox", "***REMOVED***refox", awful.util.getdir("con***REMOVED***g") .. "/***REMOVED***refox.png" ***REMOVED***,
  { "chromium", "chromium" ***REMOVED***,
  { "&***REMOVED***refox", "***REMOVED***refox" ***REMOVED***,
  { "&thunderbird", "thunderbird" ***REMOVED***,
  { "libreof***REMOVED***ce", "libreof***REMOVED***ce" ***REMOVED***,
  { "transmission", "transmission-gtk" ***REMOVED***,
  { "gimp", "gimp" ***REMOVED***,
  { "inkscape", "inkscape" ***REMOVED***,
  { "screenshooter", "xfce4-screenshooter" ***REMOVED***
***REMOVED***

M.network_main = {
  { "wicd-curses", "wicd-curses" ***REMOVED***,
  { "wicd-gtk", "wicd-gtk" ***REMOVED***
***REMOVED***

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome, beautiful.awesome_subicon ***REMOVED***,
    { "open terminal", terminal ***REMOVED***,
    { "network", M.network_main ***REMOVED***,
    { "favorite", M.favorite ***REMOVED***
  ***REMOVED***

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)

