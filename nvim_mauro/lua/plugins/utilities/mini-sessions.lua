return {
	{
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			require("mini.sessions").setup({})
		end,

		--* Keybindings *--

		-- Save a new session
		vim.api.nvim_set_keymap(
			"n",
			"<leader>sw",
			':lua MiniSessions.write(vim.fn.input("Session name: "))<CR>',
			{ noremap = true }
		),

		-- Delete session prompt
		vim.api.nvim_set_keymap("n", "<leader>sd", ':lua MiniSessions.select("delete")<CR>', { noremap = true }),

		-- Select session prompt
		vim.api.nvim_set_keymap("n", "<leader>ss", ':lua MiniSessions.select("read")<CR>', { noremap = true }),

		-- Open latest session
		vim.api.nvim_set_keymap(
			"n",
			"<leader>sl",
			":lua MiniSessions.read(MiniSessions.get_latest())<CR>",
			{ noremap = true }
		),
	},
}
