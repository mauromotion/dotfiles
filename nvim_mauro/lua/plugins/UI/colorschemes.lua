return {
	{
		"edeneast/nightfox.nvim",
		lazy = false,
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
	{
		"sainnhe/gruvbox-material",
		lazy = true,
		config = function()
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_transparent_background = 1
		end,
	},
	{
		"neanias/everforest-nvim",
		lazy = true,
		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 0.9,
				italics = true,
				disable_italics_comments = false,
				ui_contrast = "low",
			})
		end,
	},
	{ "shaunsingh/nord.nvim", lazy = true, options = {
		nord_disable_background = true,
	} },
}
