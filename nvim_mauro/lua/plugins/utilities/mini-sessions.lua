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
			-- { desc = "New [S]ession [Write]" },
			{ noremap = true }
		),

		-- Delete session prompt
		vim.api.nvim_set_keymap(
			"n",
			"<leader>sd",
			':lua MiniSessions.select("delete")<CR>',
			-- { desc = "[S]essions [D]elete" },
			{ noremap = true }
		),

		-- Select session prompt
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ss",
			':lua MiniSessions.select("read")<CR>',
			-- { desc = "[S]elect a [S]ession" },
			{ noremap = true }
		),

		-- Open last session
		vim.api.nvim_set_keymap(
			"n",
			"<leader>sl",
			":lua MiniSessions.read(MiniSessions.get_latest())<CR>",
			-- { desc = "[S]ession [L]ast open" },
			{ noremap = true }
		),
	},
}
