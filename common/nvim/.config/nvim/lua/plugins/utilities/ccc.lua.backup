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
		wk.add({
			{ "<leader>c", group = "Ccc" },
			{ "<leader>ch", "<CMD>CccHighlighterToggle<CR>", desc = "Toggle Colors Highlighter" },
			{ "<leader>cp", "<CMD>CccPick<CR>", desc = "Toggle Color Picker" },
			{ "<leader>cc", "<CMD>CccConvert<CR>", desc = "Convert Color format" },
		})
	end,
}
