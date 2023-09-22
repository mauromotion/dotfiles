return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate<CR>",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync" },
	dependencies = { "nvim-treesitter-textobjects" },
	config = function()
		require("nvim-treesitter").setup({
			highlight = { enable = true },
			incremental_selection = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"css",
				"html",
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
		})
	end,
}
-- FIXME:
