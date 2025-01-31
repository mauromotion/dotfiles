----* Imports *----
local wibox = require("wibox") -- Widget and layout library
local beautiful = require("beautiful") -- Theme handling library
local awful = require("awful") -- Standard awesome library
local custom_widget = require("utils.custom_widget") -- My custom script loading widget
local apps = require("config.apps")

local freedesktop = require("freedesktop") -- Install this with luarocks: `luarocks install lcpz/awesome-freedesktop`
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

----* Widgets *----
local _M = {}

-- Separators
_M.sections_separator = wibox.widget.textbox("  ")
_M.widgets_separator = wibox.widget.textbox("  ")

-- {{{ Textclock widget
local textclock = wibox.widget.textclock()

_M.datetime = wibox.widget({
	{
		textclock,
		widget = wibox.container.background,
		fg = beautiful.green,
		bg = beautiful.bg_normal,
	},
	margins = 4,
	widget = wibox.container.margin,
})
-- }}}

-- Keyboard map indicator and switcher --
_M.keyboardlayout = awful.widget.keyboardlayout()

--  Cpu widget --
local cpu_script_path = "/home/mauromotion/.scripts/cpu.sh"
local cpu_update_interval = 2 -- in seconds
_M.cpu = custom_widget.create(cpu_script_path, cpu_update_interval)

-- Battery widget --
local batt_script_path = "/home/mauromotion/.scripts/battery.sh"
local batt_update_interval = 15
local batt_fg = beautiful.yellow
_M.battery = custom_widget.create(batt_script_path, batt_update_interval, batt_fg)

-- Memory widget --
local mem_script_path = "/home/mauromotion/.scripts/memory.sh"
local mem_update_interval = 5
local mem_fg = beautiful.cyan
_M.memory = custom_widget.create(mem_script_path, mem_update_interval, mem_fg)

-- Updates widget --
local upds_widget_path = "/home/mauromotion/.scripts/updates.sh"
local upds_widget_interval = 400
local upds_fg = beautiful.red
_M.updates = custom_widget.create(upds_widget_path, upds_widget_interval, upds_fg)

-- Kernel widget --
local kern_widget_path = "/home/mauromotion/.scripts/kernel.sh"
local kern_update_interval = 7200
local kern_fg = beautiful.yellow
_M.kernel = custom_widget.create(kern_widget_path, kern_update_interval, kern_fg)

-- HD space 1 widget --
local hd_1_widget_path = "/home/mauromotion/.scripts/hd_space_root.sh"
local hd_1_widget_interval = 600
local hd_1_widget_fg = beautiful.blue
_M.hd1 = custom_widget.create(hd_1_widget_path, hd_1_widget_interval, hd_1_widget_fg)

-- HD space 2 widget --
local hd_2_widget_path = "/home/mauromotion/.scripts/hd_space_media.sh"
local hd_2_widget_interval = 600
local hd_2_widget_fg = beautiful.blue
_M.hd2 = custom_widget.create(hd_2_widget_path, hd_2_widget_interval, hd_2_widget_fg)

-- {{{ Volume widget
-- Function to get volume
local function get_volume(callback)
	awful.spawn.easy_async_with_shell("/home/mauromotion/.scripts/volume.sh", function(stdout)
		callback(stdout)
	end)
end

-- Create a volume widget
local volume_widget = wibox.widget.textbox()

-- Function to update volume widget
local function update_volume_widget()
	get_volume(function(volume)
		volume_widget.text = volume
	end)
end

-- Initial update
update_volume_widget()

-- Function to listen for volume changes
local function listen_for_volume_changes()
	awful.spawn.with_line_callback("pw-mon", {
		stdout = function(line)
			if line:match("change") then
				update_volume_widget()
			end
		end,
	})
end

-- Start listening for volume changes
listen_for_volume_changes()

-- Styling the volume widget
_M.volume = wibox.widget({
	{
		volume_widget,
		widget = wibox.container.background,
		fg = beautiful.pink,
		bg = beautiful.bg_normal,
	},
	margins = 4, -- Optional padding
	widget = wibox.container.margin,
})
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu

local awesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", apps.terminal .. " -e man awesome" },
	{ "edit config", apps.editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

_M.mainmenu = freedesktop.menu.build({
	before = {
		{ "Awesome", awesomemenu, beautiful.awesome_icon },
		-- other triads can be put here
	},
	after = {
		{ "Open terminal", apps.terminal },
		-- other triads can be put here
	},
})

_M.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = _M.mainmenu })

-- Menubar configuration
menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it
-- }}}

return _M
