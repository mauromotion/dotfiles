return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	options = {
		filesystem = {
			follow_current_file = { enabled = true },
		},
	},
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>n", group = "Neotree" },
			{ "<leader>nt", "<CMD>Neotree toggle<CR>", desc = "Toggle Neotree" },
		})
	end,
}
