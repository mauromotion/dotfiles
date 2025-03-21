return {
	"OXY2DEV/markview.nvim",
	lazy = false, -- Recommended
	-- ft = "markdown" -- If you decide to lazy-load anyway

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("markview").setup({
			preview = {
				filetypes = { "markdown", "vimwiki" },
			},
		})
	end,
}
