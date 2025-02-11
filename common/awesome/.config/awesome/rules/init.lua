----* Imports *----
local ruled = require("ruled") -- Declarative object management
local awful = require("awful") -- Standard awesome library

----* Rules *----
local rules = {
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
		-- ruled.client.append_rule({
		-- 	id = "titlebars",
		-- 	rule_any = { type = { "normal", "dialog" } },
		-- 	properties = { titlebars_enabled = false },
		-- })

		ruled.client.append_rule({
			rule = { class = "thunderbird" },
			properties = { screen = 1, tag = "mail" },
		})

		ruled.client.append_rule({
			rule = { class = "steam" },
			properties = { screen = 1, tag = "games" },
		})

		-- Notifications
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
	end),
}

return rules
