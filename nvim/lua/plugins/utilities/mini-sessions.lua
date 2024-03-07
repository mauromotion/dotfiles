return {
	{
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			require("mini.sessions").setup({})

			-- Keybindings with "which-key" plugin
			local wk = require("which-key")
			wk.register({
				s = {
					name = "Sessions",
					w = { ':lua MiniSessions.write(vim.fn.input("Session name: "))<CR>', "Save a new session" },
					d = { ':lua MiniSessions.select("delete")<CR>', "Delete a session" },
					s = { ':lua MiniSessions.select("read")<CR>', "Select a session" },
					l = { ":lua MiniSessions.read(MiniSessions.get_latest())<CR>", "Open last session" },
				},
			}, { prefix = "<leader>" })
		end,
	},
}
