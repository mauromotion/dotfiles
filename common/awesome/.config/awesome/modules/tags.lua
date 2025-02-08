----* Imports *----
local beautiful = require("beautiful") -- Theme handling library
local awful = require("awful") -- Standard awesome library

----* Generate tags *----
local function setup_tags(s)
	local l = awful.layout.suit -- Just to save some typing: use an alias.

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
		-- gap = 4,
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
end

return setup_tags
