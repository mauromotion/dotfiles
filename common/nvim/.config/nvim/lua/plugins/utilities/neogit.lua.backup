return {
	"NeogitOrg/neogit",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		-- "nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	config = true,
	keys = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>g", group = "Neogit/Gitsigns" },
			{ "<leader>gP", "<cmd>Neogit push<cr>", desc = "Git push (Neogit)" },
			{ "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Git switch branch (FzfLua)" },
			{ "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git commit (Neogit)" },
			{ "<leader>go", "<cmd>Neogit<cr>", desc = "Open Neogit (Neogit)" },
			{ "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Git pull (Neogit)" },
		})
	end,
}
