return {
	-- {
	-- 	"edeneast/nightfox.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("nightfox").setup({
	-- 			options = {
	-- 				transparent = true,
	-- 				dim_inactive = false,
	-- 				styles = {
	-- 					comments = "italic",
	-- 					keywords = "italic,bold",
	-- 					types = "italic,bold",
	-- 				},
	-- 			},
	-- 		})
	-- 		-- apply colorscheme
	-- 		vim.cmd([[colorscheme nordfox]])
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				styles = {
					comments = { "italic" },
					keywords = { "italic, bold" },
					types = { "italic, bold" },
				},
			})
			-- apply colorscheme
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = true,
	-- 	config = function()
	-- 		vim.g.gruvbox_material_foreground = "material"
	-- 		vim.g.gruvbox_material_background = "medium"
	-- 		vim.g.gruvbox_material_transparent_background = 1
	--  -- apply colorscheme
	-- vim.cmd([[colorscheme gruvbox-material]])
	-- 	end,
	-- },
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("everforest").setup({
	-- 			background = "hard",
	-- 			transparent_background_level = 1,
	-- 			italics = true,
	-- 			disable_italics_comments = false,
	-- 			ui_contrast = "low",
	-- 		})
	--  -- apply colorscheme
	-- vim.cmd([[colorscheme everforest]])
	-- 	end,
	-- },
}
