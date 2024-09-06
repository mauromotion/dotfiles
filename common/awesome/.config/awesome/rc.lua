-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

package.path = package.path .. ";/usr/share/lua/5.3/?.lua"

-- {{{ Required libraries
local gears = require("gears") -- Standard awesome library
local awful = require("awful") -- Standard awesome library
require("awful.autofocus")
local wibox = require("wibox") -- Widget and layout library
local my_widget = require("widgets.my_widget") -- My custom script loading widget
local beautiful = require("beautiful") -- Theme handling library
local naughty = require("naughty") -- Notification library
local ruled = require("ruled") -- Declarative object management
local menubar = require("menubar")
require("bindings") -- Keybindings
local freedesktop = require("freedesktop") -- Install this with luarocks: `luarocks install lcpz/awesome-freedesktop`
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys") -- Enable hotkeys help widget for VIM and other apps when client with a matching name is opened
-- }}}

-- {{{ Error handling
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)
-- }}}

-- {{{ Load theme
--
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init("/home/mauromotion/.config/awesome/themes/mmmotion/theme.lua")
-- }}}

-- {{{ Variable definitions
local vars = require("options.vars")

local modkey = vars.modkey
-- }}}

-- {{{ Custom functions
--
-- Function to retrieve the hostname asynchronously
hostname = nil

local function get_hostname(callback)
	awful.spawn.easy_async_with_shell("hostnamectl --static", function(stdout, stderr, reason, exit_code)
		hostname = stdout:match("^%s*(.-)%s*$") -- Trim any leading/trailing whitespace
		if callback then
			callback(hostname)
		end
	end)
end

-- Remove border when only one window
-- local function set_border(c)
-- 	local s = awful.screen.focused()
-- 	if
-- 		c.maximized
-- 		or (#s.tiled_clients == 1 and not c.floating)
-- 		or (s.selected_tag and s.selected_tag.layout.name == "max")
-- 	then
-- 		c.border_width = 0
-- 	else
-- 		c.border_width = beautiful.border_width
-- 	end
-- end

-- client.connect_signal("request::border", set_border)
-- client.connect_signal("property::maximized", set_border)
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
freedesktop_menu = freedesktop.menu.build()

myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", vars.terminal .. " -e man awesome" },
	{ "edit config", vars.editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

mymainmenu = freedesktop.menu.build({
	before = {
		{ "Awesome", myawesomemenu, beautiful.awesome_icon },
		-- other triads can be put here
	},
	after = {
		{ "Open terminal", vars.terminal },
		-- other triads can be put here
	},
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = vars.terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.floating,
		awful.layout.suit.tile,
		awful.layout.suit.tile.left,
		awful.layout.suit.tile.bottom,
		awful.layout.suit.tile.top,
		awful.layout.suit.fair,
		awful.layout.suit.fair.horizontal,
		-- awful.layout.suit.spiral,
		-- awful.layout.suit.spiral.dwindle,
		-- awful.layout.suit.max,
		-- awful.layout.suit.max.fullscreen,
		awful.layout.suit.magnifier,
		-- awful.layout.suit.corner.nw,
	})
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
	awful.wallpaper({
		screen = s,
		widget = {
			{
				image = beautiful.wallpaper,
				upscale = true,
				downscale = true,
				widget = wibox.widget.imagebox,
			},
			valign = "center",
			halign = "center",
			tiled = false,
			widget = wibox.container.tile,
		},
	})
end)
-- }}}

-- {{{ Wibar

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own tag table.
	-- local names = { " home ", " mail ", " dev ", " chat ", " docs ", " media ", " games ", " edit ", " xtra " }
	local l = awful.layout.suit -- Just to save some typing: use an alias.
	-- local layouts = { l.tile.left, l.max, l.tile, l.tile, l.tile, l.tile, l.floating, l.tile, l.tile.top }
	-- awful.tag(names, s, layouts)
	--
	local tags = {
		{
			name = "home",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_home.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_home.svg",
		},
		{
			name = "mail",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_mail.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_mail.svg",
		},
		{
			name = "dev",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_dev.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_dev.svg",
		},
		{
			name = "chat",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_chat.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_chat.svg",
		},
		{
			name = "docs",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_docs.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_docs.svg",
		},
		{
			name = "media",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_media.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_media.svg",
		},
		{
			name = "games",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_games.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_games.svg",
		},
		{
			name = "edit",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_edit.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_edit.svg",
		},
		{
			name = "extra",
			icon_unfocused = "/home/mauromotion/.config/awesome/themes/nord/taglist/unfocused_extra.svg",
			icon_focused = "/home/mauromotion/.config/awesome/themes/nord/taglist/focused_extra.svg",
		},
	}

	-- Define tags
	awful.tag.add("home", {
		icon = "",
		icon_only = true,
		layout = l.tile,
		master_fill_policy = "expand",
		gap_single_client = false,
		gap = 4,
		screen = s,
		selected = true,
	})

	awful.tag.add("mail", {
		icon = "",
		icon_only = true,
		layout = l.max,
		master_fill_policy = "expand",
		gap_single_client = true,
		gap = 15,
		screen = s,
	})

	awful.tag.add("dev", {
		icon = "",
		icon_only = true,
		layout = l.tile,
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
		layout = l.tile,
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
		-- gap_single_client = false,
		-- gap = 0,
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
			spacing = 10,
			layout = wibox.layout.fixed.horizontal,
		},
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({ modkey }, 1, function(t)
				if client.focus then
					client.focus:move_to_tag(t)
				end
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ modkey }, 3, function(t)
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

	-- Create separators
	local myseparator = wibox.widget.textbox(" ≡ ")
	local widgets_separator = wibox.widget.textbox(" │ ")

	-- My own custom widgets
	--
	--  Cpu widget
	local cpu_script_path = "/home/mauromotion/.scripts/cpu.sh"
	local cpu_update_interval = 2 -- in seconds
	local cpu_widget = my_widget.create(cpu_script_path, cpu_update_interval)

	-- Battery widget
	local batt_script_path = "/home/mauromotion/.scripts/battery.sh"
	local batt_update_interval = 15
	local batt_widget = my_widget.create(batt_script_path, batt_update_interval)

	-- Memory widget
	local mem_script_path = "/home/mauromotion/.scripts/memory.sh"
	local mem_update_interval = 5
	local mem_widget = my_widget.create(mem_script_path, mem_update_interval)

	-- Updates widget
	local upds_widget_path = "/home/mauromotion/.scripts/updates.sh"
	local upds_widget_interval = 400
	local upds_widget = my_widget.create(upds_widget_path, upds_widget_interval)

	-- Kernel widget
	local kern_widget_path = "/home/mauromotion/.scripts/kernel.sh"
	local kern_update_interval = 7200
	local kern_widget = my_widget.create(kern_widget_path, kern_update_interval)

	-- HD space 1 widget
	local hd_1_widget_path = "/home/mauromotion/.scripts/hd_space_root.sh"
	local hd_1_widget_interval = 600
	local hd_1_widget = my_widget.create(hd_1_widget_path, hd_1_widget_interval)

	-- HD space 2 widget
	local hd_2_widget_path = "/home/mauromotion/.scripts/hd_space_media.sh"
	local hd_2_widget_interval = 600
	local hd_2_widget = my_widget.create(hd_2_widget_path, hd_2_widget_interval)

	-- {{{ Volume widget
	--
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
	-- }}}
	--
	-- Create the wibox
	get_hostname(function(hostname)
		if hostname == "eva-01" then
			-- Wibox for desktop
			s.mywibox = awful.wibar({
				position = "top",
				screen = s,
				height = 22,
				widget = {
					layout = wibox.layout.align.horizontal,
					{ -- Left widgets
						layout = wibox.layout.fixed.horizontal,
						mylauncher,
						myseparator,
						s.mytaglist,
						myseparator,
						s.mypromptbox,
					},
					s.mytasklist, -- Middle widget
					{ -- Right widgets
						layout = wibox.layout.fixed.horizontal,
						myseparator,
						kern_widget,
						widgets_separator,
						hd_1_widget,
						widgets_separator,
						hd_2_widget,
						widgets_separator,
						-- cpu_widget,
						-- widgets_separator,
						mem_widget,
						widgets_separator,
						volume_widget,
						widgets_separator,
						upds_widget,
						mysystray,
						myseparator,
						mytextclock,
						s.mylayoutbox,
					},
				},
			})
		else
			-- Wibox for laptop
			s.mywibox = awful.wibar({
				position = "top",
				screen = s,
				height = 22,
				widget = {
					layout = wibox.layout.align.horizontal,
					{ -- Left widgets
						layout = wibox.layout.fixed.horizontal,
						mylauncher,
						myseparator,
						s.mytaglist,
						myseparator,
						s.mypromptbox,
					},
					s.mytasklist, -- Middle widget
					{ -- Right widgets
						layout = wibox.layout.fixed.horizontal,
						myseparator,
						-- kern_widget,
						-- widgets_separator,
						hd_1_widget,
						widgets_separator,
						mem_widget,
						widgets_separator,
						volume_widget,
						widgets_separator,
						batt_widget,
						widgets_separator,
						upds_widget,
						mysystray,
						myseparator,
						mytextclock,
						s.mylayoutbox,
					},
				},
			})
		end
	end)
end)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	})

	-- Floating clients.
	ruled.client.append_rule({
		id = "floating",
		rule_any = {
			instance = { "copyq", "pinentry" },
			class = {
				"Arandr",
				"Gpick",
				"Lxappearance",
				"Qalculate-gtk",
				"Tor Browser",
				"steam",
				"Galculator",
				"Gimp",
				"Pavucontrol",
				"Viewnior",
				"mpv",
				"Nitrogen",
				"org.cryptomator.launcher.Cryptomator$MainApp",
				"vlc",
			},
			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	})

	-- Add titlebars to normal clients and dialogs
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = false },
	})

	ruled.client.append_rule({
		rule = { class = "thunderbird" },
		properties = { screen = 1, tag = "mail" },
	})

	ruled.client.append_rule({
		rule = { class = "steam" },
		properties = { screen = 1, tag = "games" },
	})
end)
-- }}}

-- {{{ Notifications

ruled.notification.connect_signal("request::rules", function()
	-- All notifications will match this rule.
	ruled.notification.append_rule({
		rule = {},
		properties = {
			screen = awful.screen.preferred,
			implicit_timeout = 5,
		},
	})
end)

naughty.connect_signal("request::display", function(n)
	naughty.layout.box({ notification = n })
end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)

-- Autostart at launch
awful.spawn.with_shell("~/.config/awesome/autostart.sh")

-- Garbage collection to avoid lag
collectgarbage("incremental", 150, 600, 0)

gears.timer.start_new(60, function()
	-- just let it do a full collection
	collectgarbage()
	-- or else set a step size
	-- collectgarbage("step", 30000)
	return true
end)
