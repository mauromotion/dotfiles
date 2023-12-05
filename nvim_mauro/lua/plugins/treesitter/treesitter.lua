return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync" },
	dependencies = { "nvim-treesitter-textobjects", "windwp/nvim-ts-autotag" },
	opts = {
		highlight = { enable = true },
		incremental_selection = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"html",
			"htmldjango",
			"http",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
	},
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
