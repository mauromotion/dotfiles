--* Initialize lazy.nvim package manager *--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.g.vimwiki_list = { { path = "~/Notes/VimWiki" } } -- Set VimWiki deafult directory

-- Load Plugins
require("lazy").setup({
	{ import = "plugins.coding" },
	{ import = "plugins.LSP" },
	{ import = "plugins.navigation" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.UI" },
	{ import = "plugins.utilities" },
})
