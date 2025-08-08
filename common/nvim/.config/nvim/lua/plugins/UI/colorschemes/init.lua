local M = {}

local colorscheme_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/colorschemes", "*.lua", false, true)

for _, file in ipairs(colorscheme_files) do
	local name = file:match("([^/]+)%.lua$")
	if name ~= "init" then
		table.insert(M, require("colorschemes." .. name))
	end
end

return M
