return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown", "vimwiki" },
		})
	end,
	ft = { "markdown", "norg", "rmd", "org" },
}
