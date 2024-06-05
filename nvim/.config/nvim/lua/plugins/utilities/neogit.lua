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
		wk.register({
			g = {
				name = "Neogit/Gitsigns",
				o = { "<cmd>Neogit<cr>", "Open Neogit (Neogit)" },
				c = { "<cmd>Neogit commit<cr>", "Git commit (Neogit)" },
				p = { "<cmd>Neogit pull<cr>", "Git pull (Neogit)" },
				P = { "<cmd>Neogit push<cr>", "Git push (Neogit)" },
				b = { "<cmd>FzfLua git_branches<cr>", "Git switch branch (FzfLua)" },
			},
		}, { prefix = "<leader>" })
	end,
}
