----* Imports *----
local awful = require("awful") -- Standard awesome library
local beautiful = require("beautiful") -- Theme handling library
local wibox = require("wibox") -- Widget and layout library
local vars = require("config.vars")
local custom_funcs = require("utils.custom_functions")

----* Toolbar *-----
print("Toolbar is being set up!")
screen.connect_signal("request::desktop_decoration", function(s)
	print("Desktop decoration request received!")
	-- Each screen has its own tag table.
	-- local names = { " home ", " mail ", " dev ", " chat ", " docs ", " media ", " games ", " edit ", " xtra " }
	local l = awful.layout.suit -- Just to save some typing: use an alias.
	-- local layouts = { l.tile.left, l.max, l.tile, l.tile, l.tile, l.tile, l.floating, l.tile, l.tile.top }
	-- awful.tag(names, s, layouts)
	--
	tag.connect_signal("request::default_layouts", function()
		awful.layout.append_default_layouts(vars.layouts)
	end)

	local tags = {
		{
			name = "home",
			icon_unfocused = beautiful.tag_icon_home_unfocused,
			icon_focused = beautiful.tag_icon_home_focused,
		},
		{
			name = "mail",
			icon_unfocused = beautiful.tag_icon_mail_unfocused,
			icon_focused = beautiful.tag_icon_mail_focused,
		},
		{
			name = "dev",
			icon_unfocused = beautiful.tag_icon_dev_unfocused,
			icon_focused = beautiful.tag_icon_dev_focused,
		},
		{
			name = "chat",
			icon_unfocused = beautiful.tag_icon_chat_unfocused,
			icon_focused = beautiful.tag_icon_chat_focused,
		},
		{
			name = "docs",
			icon_unfocused = beautiful.tag_icon_docs_unfocused,
			icon_focused = beautiful.tag_icon_docs_focused,
		},
		{
			name = "media",
			icon_unfocused = beautiful.tag_icon_media_unfocused,
			icon_focused = beautiful.tag_icon_media_focused,
		},
		{
			name = "games",
			icon_unfocused = beautiful.tag_icon_games_unfocused,
			icon_focused = beautiful.tag_icon_games_focused,
		},
		{
			name = "edit",
			icon_unfocused = beautiful.tag_icon_edit_unfocused,
			icon_focused = beautiful.tag_icon_edit_focused,
		},
		{
			name = "extra",
			icon_unfocused = beautiful.tag_icon_extra_unfocused,
			icon_focused = beautiful.tag_icon_extra_focused,
		},
	}

	-- Define tags
	awful.tag.add("home", {
		icon = "",
		icon_only = true,
		layout = l.tile.left,
		master_fill_policy = "expand",
		gap_single_client = false,
		gap = 4,
		screen = s,
		selected = true,
	})

	awful.tag.add("mail", {
		icon = "",
		icon_only = true,
		layout = l.tile.left,
		master_fill_policy = "expand",
		gap_single_client = true,
		gap = 18,
		screen = s,
	})

	awful.tag.add("dev", {
		icon = "",
		icon_only = true,
		layout = l.tile.left,
		master_fill_policy = "expand",
		-- gap_single_client = false,
		-- gap = 0,
		screen = s,
	})

	awful.tag.add("chat", {
		icon = "",
		icon_only = true,
		layout = l.fair,
		-- master_fill_policy = "expand",
		-- gap_single_client = false,
		gap = 4,
		screen = s,
	})

	awful.tag.add("docs", {
		icon = "",
		icon_only = true,
		layout = l.tile,
		master_fill_policy = "expand",
		gap_single_client = false,
		gap = 6,
		screen = s,
	})

	awful.tag.add("media", {
		icon = "",
		icon_only = true,
		layout = l.tile.left,
		master_fill_policy = "expand",
		gap_single_client = false,
		gap = 10,
		screen = s,
	})

	awful.tag.add("games", {
		icon = "",
		icon_only = true,
		layout = l.floating,
		-- master_fill_policy = "master_width_factor",
		-- gap_single_client = false,
		-- gap = 0,
		screen = s,
	})

	awful.tag.add("edit", {
		icon = "",
		icon_only = true,
		layout = l.tile.left,
		master_fill_policy = "expand",
		-- gap_single_client = false,
		-- gap = 0,
		screen = s,
	})

	awful.tag.add("extra", {
		icon = "",
		icon_only = true,
		layout = l.tile.top,
		-- master_fill_policy = "master_width_factor",
		gap_single_client = false,
		gap = 6,
		screen = s,
	})

	-- Loop through screens and tags
	for sc = 1, screen.count() do
		for i, tag in ipairs(awful.tag.gettags(sc)) do
			local tag_info = tags[i]

			-- Connect to the selected signal for each tag
			tag:connect_signal("property::selected", function(t)
				if t.selected then
					-- Set the focused icon
					t.icon = tag_info.icon_focused
				else
					-- Set the unfocused icon
					t.icon = tag_info.icon_unfocused
				end
			end)
		end
	end

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox({
		screen = s,
		buttons = {
			awful.button({}, 1, function()
				awful.layout.inc(1)
			end),
			awful.button({}, 3, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 4, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 5, function()
				awful.layout.inc(1)
			end),
		},
	})

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

	-- Move the systray on secondary monitor for desktop PC, and keep it on primary for laptop
	-- get_hostname(function(hostname)
	-- 	if hostname == "eva-01" then
	-- 		mysystray:set_screen(screen[2])
	-- 	else
	-- 		mysystray:set_screen("primary")
	-- 	end
	-- end)

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
