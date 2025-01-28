local awful = require("awful")
local widgets = require("modules.widgets") -- Custom widgets
require("awful.autofocus")

awful.mouse.append_global_mousebindings({
	awful.button({}, 3, function()
		widgets.mainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)
