return {
	"ibhagwan/fzf-lua",
	-- cmd = "FzfLua",
	-- optional for icon support
	dependencies = { "echasnovski/mini.icons", "rktjmp/lush.nvim" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({ "telescope" })

		-- Keymaps
		local wk = require("which-key")

		--== Requires "which-key" plugin ==--
		wk.add({
			{ "<leader><Space>", "<CMD>FzfLua buffers<CR>", desc = "List open buffers" },
			{ "<leader>f", group = "FzfLua" },
			{ "<leader>fc", "<CMD>FzfLua grep_cword<CR>", desc = "Search for word under cursor" },
			{ "<leader>ff", "<CMD>FzfLua files<CR>", desc = "Fuzzy find files in cwd" },
			{ "<leader>fg", "<CMD>FzfLua live_grep<CR>", desc = "Find string in cwd" },
			{ "<leader>fk", "<CMD>FzfLua keymaps<CR>", desc = "Search through all the keybindings" },
			{ "<leader>fr", "<CMD>FzfLua oldfiles<CR>", desc = "Fuzzy find recent files" },
			{ "<leader>fs", "<CMD>FzfLua lgrep_curbuf<CR>", desc = "Find string in current buffer" },
		})
	end,
}
