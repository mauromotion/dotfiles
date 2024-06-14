return {
	"ibhagwan/fzf-lua",
	-- cmd = "FzfLua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({ "telescope" })

		-- Keymaps
		local wk = require("which-key")

		--== Requires "which-key" plugin ==--
		wk.register({
			f = {
				name = "FzfLua",
				f = { "<CMD>FzfLua files<CR>", "Fuzzy find files in cwd" },
				r = { "<CMD>FzfLua oldfiles<CR>", "Fuzzy find recent files" },
				g = { "<CMD>FzfLua live_grep<CR>", "Find string in cwd" },
				s = { "<CMD>FzfLua lgrep_curbuf<CR>", "Find string in current buffer" },
				c = { "<CMD>FzfLua grep_cword<CR>", "Search for word under cursor" },
				k = { "<CMD>FzfLua keymaps<CR>", "Search through all the keybindings" },
			},
			["<Space>"] = {
				"<CMD>FzfLua buffers<CR>",
				"List open buffers",
			},
		}, { prefix = "<leader>" })
	end,
}
