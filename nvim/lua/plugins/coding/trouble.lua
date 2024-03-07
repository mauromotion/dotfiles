return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "TroubleToggle", "Trouble" },
	opts = { use_diagnostic_signs = true },
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
				x = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
				X = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
				L = { "<cmd>TroubleToggle loclist<cr>", "Location List" },
				Q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List" },
			},
		}, { prefix = "<leader>" })
	end,
}
