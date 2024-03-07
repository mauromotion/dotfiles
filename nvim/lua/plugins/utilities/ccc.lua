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
		-- Keybindings with "which-key" plugin
		local wk = require("which-key")
		wk.register({
			c = {
				name = "Ccc",
				h = { "<CMD>CccHighlighterToggle<CR>", "Toggle Colors Highlighter" },
				p = { "<CMD>CccPick<CR>", "Toggle Color Picker" },
				c = { "<CMD>CccConvert<CR>", "Convert Color format" },
			},
		}, { prefix = "<leader>" })
	end,
}
