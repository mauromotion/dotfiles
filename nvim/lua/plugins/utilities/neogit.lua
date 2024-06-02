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
				o = { "<cmd>Neogit<cr>", "Open Neogit" },
				c = { "<cmd>Neogit commit<cr>", "Git commit" },
				p = { "<cmd>Neogit pull<cr>", "Git pull" },
				P = { "<cmd>Neogit push<cr>", "Git push" },
				b = { "<cmd>FzfLua git_branches<cr>", "Git switch branch" },
			},
		}, { prefix = "<leader>" })
	end,
}
