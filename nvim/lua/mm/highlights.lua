------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dot***REMOVED***les * --
-- Neovim -- highlights.lua --------------------------------

-- COLORSCHEMES

-- Uncomment just ONE of the following colorschemes!
-- local ok, _ = pcall(vim.cmd, 'colorscheme onedark')
-- local ok, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
-- local ok, _ = pcall(vim.cmd, "colorscheme everforest")
local ok, _ = pcall(vim.cmd, "colorscheme onedark")

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 ***REMOVED***)
	end,
***REMOVED***)
