local awful = require("awful")
local menubar = require("menubar")
local vars = require("options.vars")
local modkey = vars.modkey
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- {{{ Custom functions
--
-- Dwm-like focus switching
local function swap_master()
	if client.focus == awful.client.getmaster() then
		awful.client.swap.byidx(1)
		awful.client.focus.byidx(-1)
	else
		awful.client.setmaster(client.focus)
	end
end

-- Toggle wibar visibility on a all screens
local function toggle_wibar()
	for s in screen do
		s.mywibox.visible = not s.mywibox.visible
	end
end
-- }}}

-- {{{ Key bindings
--
-- General Awesome keys
awful.keyboard.append_global_keybindings({

	-- Show keybindings screen
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	-- Show apps menu
	awful.key({ modkey }, "w", function()
		mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),

	-- Toggle the wibar
	awful.key({ modkey, "Control" }, "b", toggle_wibar, { description = "toggle wibar", group = "awesome" }),

	-- Restart Awesome
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),

	-- Quit Awesome
	awful.key({ modkey, "Control" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	-- Run Lua code on bar prompt
	awful.key({ modkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),

	-- Launch a terminal
	awful.key({ modkey, "Shift" }, "Return", function()
		awful.spawn(vars.terminal)
	end, { description = "open a terminal", group = "launcher" }),

	-- Run bar prompt
	awful.key({ modkey }, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, { description = "run prompt", group = "launcher" }),

	-- Show the menubar
	awful.key({ modkey, "Shift" }, "p", function()
		menubar.show()
	end, { description = "show the menubar", group = "launcher" }),

	-- Launch rofi
	awful.key({ modkey }, "g", function()
		awful.spawn("rofi -show combi")
	end, { description = "launch rofi", group = "launcher" }),

	-- Launch rofi power menu
	awful.key({ modkey }, "p", function()
		awful.spawn(
			'rofi -show power-menu -modi "power-menu:rofi-power-menu --choices=suspend/logout/lockscreen/reboot/shutdown"'
		)
	end, { description = "launch power menu", group = "launcher" }),

	-- Launch the browser
	awful.key({ modkey }, "b", function()
		awful.spawn(vars.browser)
	end, { description = "launch browser", group = "launcher" }),

	-- Launch the file browser
	awful.key({ modkey, "Shift" }, "f", function()
		awful.spawn(vars.filebrowser)
	end, { description = "launch file browser", group = "launcher" }),

	-- Take a screenshot
	awful.key({ modkey, "Shift" }, "z", function()
		awful.spawn("flameshot gui")
	end, { description = "take a screenshot", group = "launcher" }),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Tab", awful.tag.history.restore, { description = "go back", group = "tag" }),
})
-- Focus related keybindings
awful.keyboard.append_global_keybindings({

	awful.key({ modkey }, "Return", function()
		swap_master()
	end, { description = "swap master", group = "client" }),

	awful.key({ modkey }, "e", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),

	awful.key({ modkey }, "i", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),

	awful.key({ modkey }, "Escape", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	awful.key({ modkey, "Control" }, "e", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),

	awful.key({ modkey, "Control" }, "i", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),

	awful.key({ modkey, "Control" }, "l", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:activate({ raise = true, context = "key.unminimize" })
		end
	end, { description = "restore minimized", group = "client" }),
})

-- Layout related keybindings

awful.keyboard.append_global_keybindings({

	awful.key({ modkey, "Shift" }, "e", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "i", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "o", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "n", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "d", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "c", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "comma", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),
})

awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag == screen.selected_tag then
				awful.tag.history.restore()
			else
				tag:view_only()
			end
		end,
	}),

	awful.key({
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Shift" },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control", "Shift" },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey },
		keygroup = "numpad",
		description = "select layout directly",
		group = "layout",
		on_press = function(index)
			local t = awful.screen.focused().selected_tag
			if t then
				t.layout = t.layouts[index] or t.layout
			end
		end,
	}),
})
-- }}}
