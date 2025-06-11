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

	---- ** Zenbones ** ----
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.zenbones_lightness = "dim"
			-- vim.g.zenwritten_darken_comments = 45
			-- vim.g.zenwritten_darkness = "stark"
			vim.cmd.colorscheme("zenbones")
		end,
	},

	-- ** ef-themes ** ----
	{
		"oonamo/ef-themes.nvim",
		lazy = false,
		-- priority = 999,
		config = function()
			require("ef-themes").setup({
				light = "ef-kassio", -- Ef-theme to select for light backgrounds
				dark = "ef-owl", -- Ef-theme to select for dark backgrounds
				transparent = false,
				styles = {
					-- Set specific styles for specific highlight groups
					-- Can be any valid attr-list value. See `:h nvim_set_hl`
					comments = { italic = true },
					keywords = { bold = true },
					functions = {},
					variables = {},
					classes = { bold = true },
					types = { bold = true },

					diagnostic = "default", -- Can be "full"
					pickers = "default", -- Can be "borderless"
				},

				modules = {
					-- Enable/Disable highlights for a module
					-- See `h: ef-themes-modules` for the list of available modules
					blink = true,
					fzf = true,
					mini = true,
					render_markdown = true,
					semantic_tokens = true,
					treesitter = true,
					which_key = true,
				},

				--- Override any color from the ef-theme
				---@param colors Ef-Theme
				---@param name string
				on_colors = function(colors, name) end,

				--- Override specific highlights
				---@param highlights table
				---@param colors Ef-Theme
				---@param name string
				---@return table
				on_highlights = function(highlights, colors, name)
					-- Returns a table of highlights
					-- return {
					--   Normal = { fg = colors.fg_alt, bg = colors.bg_inactive }
					--   ObscurePlugin = { fg = colors.yellow_faint }
					-- }
				end,

				options = {
					compile = true, -- Whether to compile a theme
					compile_path = vim.fn.stdpath("cache") .. "/ef-themes", -- Directory in which to place compiled themes
				},
			})

			vim.cmd.colorscheme("ef-theme") -- To use the default colorscheme defined above
			-- Or choose a specific theme
			-- vim.cmd.colorscheme("ef-dream")
		end,
	},
	---- ** Lackluster ** ----
	-- {
	-- 	"slugbyte/lackluster.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	-- 		-- vim.cmd.colorscheme("lackluster")
	-- 		vim.cmd.colorscheme("lackluster-hack")
	-- 		-- vim.cmd.colorscheme("lackluster-mint")
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
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.gruvbox_material_foreground = "material"
	-- 		vim.g.gruvbox_material_background = "medium"
	-- 		vim.g.gruvbox_material_transparent_background = 0
	-- 		-- apply colorscheme
	-- 		vim.cmd([[colorscheme gruvbox-material]])
	-- 		vim.cmd([[set background=light]])
	-- 	end,
	-- },
	---- ** Material ** ----
	-- {
	-- 	"marko-cerovac/material.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("material.").setup({
	-- 			styles = {
	-- 				comments = { italic = true },
	-- 				keywords = { italic = true },
	-- 			},
	-- 			plugins = { "mini", "fidget", "flash", "gitsigns", "indent-blankline", "trouble", "which-key" },
	-- 			lualine_style = "stealth",
	-- 		})
	-- 		vim.g.material_style = "oceanic"
	-- 		vim.cmd([[colorscheme material]])
	-- 	end,
	-- },
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
