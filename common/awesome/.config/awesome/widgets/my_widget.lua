local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local my_widget = {}

function my_widget.create(bash_script, update_interval, fg, bg)
	-- Create the textbox widget
	local textbox = wibox.widget({
		widget = wibox.widget.textbox,
	})

	-- Wrap it in a container for styling
	local widget = wibox.widget({
		{
			textbox,
			widget = wibox.container.background,
			fg = fg, -- Apply the foreground color
			bg = bg, -- Apply the background color
		},
		margins = 4, -- Optional padding
		widget = wibox.container.margin,
	})

	-- Update the widget with the script output
	local function update_widget()
		awful.spawn.easy_async_with_shell(bash_script, function(stdout)
			textbox.text = stdout
		end)
	end

	-- Set up a timer to update the widget periodically
	gears.timer({
		timeout = update_interval,
		autostart = true,
		call_now = true,
		callback = update_widget,
	})

	return widget
end

return my_widget
