return {
	"folke/trouble.nvim",
	-- branch = "main",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "TroubleToggle", "Trouble" },
	-- opts = { use_diagnostic_signs = true },
	-- keys = {
	-- 	{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
	-- 	{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
	-- 	{ "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
	-- 	{ "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
	-- },
	keys = function()
		local wk = require("which-key")
		wk.register({
			x = {
				name = "Trouble",
				x = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
				X = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
				L = { "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)" },
				Q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
			},
			c = {
				name = "Trouble",
				s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
				l = {
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					"LSP Definitions / references / ... (Trouble)",
				},
			},
		}, { prefix = "<leader>" })
	end,
	opts = {},
}
