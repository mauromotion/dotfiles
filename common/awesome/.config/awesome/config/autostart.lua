local awful = require("awful")
local gears = require("gears") -- Required for adding delays

-- Function to start applications at startup
local function start_apps()
	-- List of applications to autostart
	local processes = {
		"picom",
		"udiskie",
		"polkit-gnome-authentication-agent-1",
		"nextcloud",
		"openrgb",
	}

	-- Kill already existing processes to avoid duplication
	-- This loop checks if each process is running and kills it if found
	for _, proc in ipairs(processes) do
		awful.spawn.easy_async_with_shell("pgrep -x " .. proc .. " && killall " .. proc)
	end

	-- Adding a slight delay to allow processes to properly stop before restarting them
	gears.timer({
		timeout = 2, -- 2 seconds delay before relaunching
		autostart = true,
		callback = function()
			-- Now launch the autostart applications after ensuring no duplicates are running
			awful.spawn("picom -b") -- Background compositor for transparency and effects
			awful.spawn("nitrogen --restore") -- Restore wallpaper from previous session
			awful.spawn("udiskie -a -n -t") -- Autostart udiskie for mounting drives
			awful.spawn("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1") -- PolicyKit authentication agent
			awful.spawn("nextcloud --background") -- Nextcloud client in background
			awful.spawn("openrgb --startminimized") -- OpenRGB for controlling RGB lighting
			awful.spawn("xset b 100") -- Set beep volume to 100
			awful.spawn("~/.icc_color_profiles/load_icc_color_profiles.sh") -- Load color profiles script
		end,
	})
end

-- Call the function to start applications at startup
start_apps()

-- Return the function for potential use elsewhere if needed
return {
	start_apps = start_apps, -- Return the start_apps function in case you want to use it later
}
