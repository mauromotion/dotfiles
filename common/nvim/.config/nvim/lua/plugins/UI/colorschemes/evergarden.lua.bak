return {
	"everviolet/nvim",
	name = "evergarden",
	lazy = false,
	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	opts = {
		theme = {
			variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
			accent = "green",
		},
		editor = {
			transparent_background = true,
			sign = { color = "none" },
			float = {
				color = "mantle",
				solid_border = false,
			},
			completion = {
				color = "surface0",
			},
		},
	},
	config = function(_, opts)
		require("evergarden").setup(opts)
		vim.cmd.colorscheme("evergarden")
	end,
}
