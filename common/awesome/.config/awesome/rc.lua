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

-- Variables
local vars = require("config.vars")

-- Load theme and assets
local home = os.getenv("HOME")
local config_path = home .. "/.config/awesome"
beautiful.init(string.format(config_path .. "/themes/mmmotion/theme-%s.lua", vars.theme))

-- Load modules
require("modules") -- Toolbar and widgets
require("bindings") -- Keybindings
require("notifications") -- Error messages and notifications
require("rules") -- Clients' rules

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
