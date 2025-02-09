----* Imports *----
local awful = require("awful") -- Standard awesome library
local gears = require("gears") -- Standard awesome library
local wibox = require("wibox") -- Widget and layout library
local vars = require("config.vars")
local custom_funcs = require("utils.custom_functions")
local setup_tags = require("modules.tags")

----* Toolbar *-----
screen.connect_signal("request::desktop_decoration", function(s)
	tag.connect_signal("request::default_layouts", function()
		awful.layout.append_default_layouts(vars.layouts)
	end)

	-- Create tags
	setup_tags(s)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- TODO: move widgets from here following this: https://github.com/suconakh/awesome-awesome-rc/blob/main/widgets/init.lua
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		-- filter = awful.widget.taglist.filter.all,
		filter = function(t)
			return t.selected or #t:clients() > 0
		end,
		layout = {
			spacing = 5,
			layout = wibox.layout.fixed.horizontal,
		},
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({ vars.modkey }, 1, function(t)
				if client.focus then
					client.focus:move_to_tag(t)
				end
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ vars.modkey }, 3, function(t)
				if client.focus then
					client.focus:toggle_tag(t)
				end
			end),
			awful.button({}, 4, function(t)
				awful.tag.viewprev(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewnext(t.screen)
			end),
		},
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = {
			awful.button({}, 1, function(c)
				c:activate({ context = "tasklist", action = "toggle_minimization" })
			end),
			awful.button({}, 3, function()
				awful.menu.client_list({ theme = { width = 250 } })
			end),
			awful.button({}, 4, function()
				awful.client.focus.byidx(-1)
			end),
			awful.button({}, 5, function()
				awful.client.focus.byidx(1)
			end),
		},
		widget_template = {
			{
				{
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = 10,
				right = 10,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
			create_callback = function(self, c, index, objects) --luacheck: no unused args
				self:get_children_by_id("text_role")[1].markup = "<b>" .. c.name .. "</b>"
			end,
		},
	})
	-- Customize the systray
	local mysystray = wibox.widget.systray()
	mysystray:set_base_size(20)

	-- Move the systray on the secondary monitor, if secondary monitor is present
	if screen[2] then
		mysystray:set_screen(screen[2])
	else
		mysystray:set_screen("primary")
	end

	-- Create the wibox
	custom_funcs.get_hostname(function(hostname)
		if hostname == "eva-01" then
			-- Wibox for desktop
			local widgets = require("modules.widgets") -- Custom widgets

			s.mywibox = awful.wibar({
				position = "top",
				screen = s,
				height = 26,
				widget = {
					layout = wibox.layout.align.horizontal,
					{ -- Left widgets
						layout = wibox.layout.fixed.horizontal,
						widgets.launcher,
						widgets.sections_separator,
						s.mytaglist,
						widgets.sections_separator,
						s.mypromptbox,
					},
					s.mytasklist, -- Middle widget
					{ -- Right widgets
						layout = wibox.layout.fixed.horizontal,
						widgets.sections_separator,
						widgets.kernel,
						widgets.widgets_separator,
						widgets.hd1,
						widgets.widgets_separator,
						widgets.hd2,
						widgets.widgets_separator,
						-- widgets.cpu,
						-- widgets.widgets_separator,
						widgets.memory,
						widgets.widgets_separator,
						widgets.volume,
						-- widgets.widgets_separator,
						widgets.updates,
						wibox.widget({
							mysystray,
							widget = wibox.container.place, -- Center the systray vertically
							valign = "center",
						}),
						widgets.sections_separator,
						widgets.datetime,
						s.mylayoutbox,
					},
				},
			})
		else
			-- Wibox for laptop
			local widgets = require("modules.widgets") -- Custom widgets

			s.mywibox = awful.wibar({
				position = "top",
				screen = s,
				height = 26,
				widget = {
					layout = wibox.layout.align.horizontal,
					{ -- Left widgets
						layout = wibox.layout.fixed.horizontal,
						widgets.launcher,
						widgets.sections_separator,
						s.mytaglist,
						widgets.sections_separator,
						s.mypromptbox,
					},
					s.mytasklist, -- Middle widget
					{ -- Right widgets
						layout = wibox.layout.fixed.horizontal,
						widgets.sections_separator,
						widgets.hd1,
						widgets.widgets_separator,
						widgets.memory,
						widgets.widgets_separator,
						widgets.volume,
						widgets.widgets_separator,
						widgets.battery,
						widgets.widgets_separator,
						widgets.keyboardlayout,
						widgets.updates,
						wibox.widget({
							mysystray,
							widget = wibox.container.place, -- Center the systray vertically
							valign = "center",
						}),
						widgets.sections_separator,
						widgets.datetime,
						s.mylayoutbox,
					},
				},
			})
		end
	end)
end)
