return {
	---- ** NordFox ** ----
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
	---- ** Catppuccin ** ----
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha",
	-- 			transparent_background = false,
	-- 			styles = {
	-- 				comments = { "italic" },
	-- 				keywords = { "italic, bold" },
	-- 				types = { "italic, bold" },
	-- 			},
	-- 		})
	-- 		-- apply colorscheme
	-- 		vim.cmd([[colorscheme catppuccin]])
	-- 	end,
	-- },
	---- ** Tokyo Night ** ----
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },
	---- ** Poimandres ** ----
	-- {
	-- 	"olivercederborg/poimandres.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local p = require("poimandres.palette")
	-- 		require("poimandres").setup({
	-- 			disable_background = false,
	-- 			highlight_groups = {
	-- 				-- LspReferenceText = { bg = p.background1, fg = p.text },
	-- 				-- LspReferenceRead = { bg = p.background1, fg = p.text },
	-- 				-- LspReferenceWrite = { bg = p.background1, fg = p.text },
	-- 				LspReferenceText = { link = "Visual" },
	-- 				LspReferenceRead = { link = "Visual" },
	-- 				LspReferenceWrite = { link = "Visual" },
	-- 			},
	-- 		})
	-- 	end,

	-- 	-- Set the colorscheme
	-- 	init = function()
	-- 		vim.cmd("colorscheme poimandres")
	-- 		vim.cmd("highlight Comment cterm=italic gui=italic")
	-- 		vim.cmd("highlight FloatBorder guifg=#E4F0FB guibg=#1B1E28")
	-- 	end,
	-- },

	---- ** Edge ** ----
	-- {
	-- 	"sainnhe/edge",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.edge_style = "aura"
	-- 		vim.g.edge_better_performance = 1
	-- 		vim.g.edge_enable_italic = true
	-- 		vim.g.edge_disable_italic_comment = false
	-- 		vim.cmd.colorscheme("edge")
	-- 	end,
	-- },

	---- ** Gruvbox ** ----
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_transparent_background = 0
			-- apply colorscheme
			vim.cmd([[colorscheme gruvbox-material]])
			vim.cmd([[set background=light]])
		end,
	},
	---- ** Everforest ** ----
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
