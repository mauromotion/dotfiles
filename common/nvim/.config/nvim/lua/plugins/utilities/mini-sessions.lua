return {
	{
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			require("mini.sessions").setup({})

			-- Keybindings with "which-key" plugin
			local wk = require("which-key")
			wk.add({
				{ "<leader>s", group = "Sessions" },
				{ "<leader>sd", ':lua MiniSessions.select("delete")<CR>', desc = "Delete a session" },
				{ "<leader>sl", ":lua MiniSessions.read(MiniSessions.get_latest())<CR>", desc = "Open last session" },
				{ "<leader>ss", ':lua MiniSessions.select("read")<CR>', desc = "Select a session" },
				{
					"<leader>sw",
					':lua MiniSessions.write(vim.fn.input("Session name: "))<CR>',
					desc = "Save a new session",
				},
			})
		end,
	},
}
