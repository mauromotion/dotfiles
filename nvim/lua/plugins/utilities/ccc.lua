return {
	"uga-rosa/ccc.nvim",
	event = "BufRead",
	config = function()
		require("ccc").setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})
	end,
}
