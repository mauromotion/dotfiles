local awful = require("awful")

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
		-- Kill existing processes
		awful.spawn.easy_async_with_shell("pgrep -f " .. proc .. " && killall -9 " .. proc)
	end

	-- Start each application asynchronously in the background
	awful.spawn.easy_async_with_shell("picom -b &")
	awful.spawn.easy_async_with_shell("nitrogen --restore &")
	awful.spawn.easy_async_with_shell("udiskie -a -n -t &")
	awful.spawn.easy_async_with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")
	awful.spawn.easy_async_with_shell("nextcloud --background &")
	awful.spawn.easy_async_with_shell("openrgb --startminimized &")
	awful.spawn.easy_async_with_shell("xset b 100 &")
	awful.spawn.easy_async_with_shell("~/.icc_color_profiles/load_icc_color_profiles.sh &")
end

-- Call the function to start applications at startup
start_apps()

-- Return the function for potential use elsewhere if needed
return {
	start_apps = start_apps, -- Return the start_apps function in case you want to use it later
}
