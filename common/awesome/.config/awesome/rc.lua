-----------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * AwesomeWM * --
-- --------------------------------

-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

package.path = package.path .. ";/usr/share/lua/5.3/?.lua"

-- Import libraries
local gears = require("gears") -- Standard awesome library
local awful = require("awful") -- Standard awesome library
local beautiful = require("beautiful") -- Theme handling library
local naughty = require("naughty") -- Notification library
local vars = require("options.vars")

-- Load theme and assets
local home = os.getenv("HOME")
local config_path = home .. "/.config/awesome"
beautiful.init(string.format(config_path .. "/themes/mmmotion/theme-%s.lua", vars.theme))

-- Load modules
require("wibar.wibar") -- Wibar
require("bindings") -- Keybindings
require("rules.rules") -- Clients' rules
require("awful.hotkeys_popup.keys") -- Enable hotkeys help widget for VIM and other apps when client with a matching name is opened
require("awful.autofocus")

-- Error handling
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)

-- Autostart at launch
awful.spawn.with_shell(home .. "/.config/awesome/autostart.sh")

-- Garbage collection to avoid lag
collectgarbage("incremental", 150, 600, 0)

gears.timer.start_new(60, function()
	-- just let it do a full collection
	collectgarbage()
	-- or else set a step size
	-- collectgarbage("step",
	return true
end)
