-- Initialize lazy.nvim package manager
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

require("lazy").setup({
	-- Color schemes
	"sainnhe/gruvbox-material",
	config = function()
		vim.g.gruvbox_material_foreground = "material"
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_transparent_background = 0
	end,

	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				transparent = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		},
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSUpdateSync" },
		config = function()
			require("mm.plugins.treesitter")
		end,
	},
	-- Highlight colors
	{ "brenoprata10/nvim-highlight-colors" },
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("mm.plugins.lualine")
		end,
	},
})
