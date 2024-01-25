return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter-textobjects", "windwp/nvim-ts-autotag" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<C-s>", desc = "Increment selection" },
		{ "<bs>", desc = "Decrement selection", mode = "x" },
	},
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"diff",
			"gitignore",
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
			"rust",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s>",
					node_incremental = "<C-s>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
		require("nvim-ts-autotag").setup()
	end,
}
