local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local my_widget = {}

function my_widget.create(bash_script, update_interval)
	local widget = wibox.widget.textbox()

	local function update_widget()
		awful.spawn.easy_async_with_shell(bash_script, function(stdout)
			widget.text = stdout
		end)
	end

	gears.timer({
		timeout = update_interval,
		autostart = true,
		call_now = true,
		callback = update_widget,
	})

	return widget
end

return my_widget
