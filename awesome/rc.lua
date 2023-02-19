-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Miscellanous awesome library
local menubar = require("menubar")

RC = {***REMOVED*** -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")

-- {{{ Error handling -- ***REMOVED******REMOVED******REMOVED***
require("main.error-handling")

-- {{{ Variable de***REMOVED***nitions
-- Themes de***REMOVED***ne colours, icons, font and wallpapers.
beautiful.init(gears.***REMOVED***lesystem.get_themes_dir() .. "default/theme.lua")
beautiful.wallpaper = RC.vars.wallpaper
-- ***REMOVED******REMOVED******REMOVED***

modkey = RC.vars.modkey

-- Custom Local Library
local main = {
  layouts = require("main.layouts"),
  tags    = require("main.tags"),
  menu    = require("main.menu"),
  rules   = require("main.rules"),
***REMOVED***

-- Custom Local Library: Keys and Mouse Binding
local binding = {
  globalbuttons = require("bindings.globalbuttons"),
  clientbuttons = require("bindings.clientbuttons"),
  globalkeys    = require("bindings.globalkeys"),
  bindtotags    = require("bindings.bindtotags"),
  clientkeys    = require("bindings.clientkeys")
***REMOVED***

-- {{{ Layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
-- a variable needed in main.tags, and statusbar
-- awful.layout.layouts = { ... ***REMOVED***
RC.layouts = main.layouts()
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Tags
-- De***REMOVED***ne a tag table which hold all screen tags.
-- a variable needed in rules, tasklist, and globalkeys
RC.tags = main.tags()
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Menu
-- Create a laucher widget and a main menu
RC.mainmenu = awful.menu({ items = main.menu() ***REMOVED***) -- in globalkeys

-- a variable needed in statusbar (helper)
RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu ***REMOVED***
)

-- Menubar con***REMOVED***guration
-- Set the terminal for applications that require it
menubar.utils.terminal = RC.vars.terminal

-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)
-- ***REMOVED******REMOVED******REMOVED***

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Statusbar: Wibar
require("looks.statusbar")
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Signals
require("main.signals")
-- ***REMOVED******REMOVED******REMOVED***

-- Autostart applications
awful.spawn.with_shell("picom")
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("~/.con***REMOVED***g/awesome/autostart.sh")
-- os.execute("~/.con***REMOVED***g/awesome/autostart.sh")
