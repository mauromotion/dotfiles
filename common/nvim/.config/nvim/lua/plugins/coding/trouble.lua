return {
	"folke/trouble.nvim",
	-- branch = "main",
	dependencies = { "echasnovski/mini.icons" },
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
		wk.add({
			{ "<leader>x", group = "Trouble" },
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
		})
	end,
}
