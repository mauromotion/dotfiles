return {
	"sainnhe/gruvbox-material",
	lazy = false,
	config = function()
		vim.g.gruvbox_material_foreground = "material"
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_transparent_background = 0
	end,

	{
		"edeneast/nightfox.nvim",
    lazy = true,
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
}
