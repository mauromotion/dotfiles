-- Imports --
local awful = require("awful") -- Standard awesome library

local utils = {}

-- Function to retrieve the hostname asynchronously
local hostname = nil

local function get_hostname(callback)
	awful.spawn.easy_async_with_shell("hostnamectl --static", function(stdout, stderr, reason, exit_code)
		hostname = stdout:match("^%s*(.-)%s*$") -- Trim any leading/trailing whitespace
		if callback then
			callback(hostname)
		end
	end)
end

utils.get_hostname = get_hostname

return utils
