return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	keys = {
		{
			"<leader>t",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
		},
		window = {
			mappings = {
				["<space>"] = "none",
			},
		},
	},
	-- config = function()
	-- 	local wk = require("which-key")

	-- 	wk.add({
	-- 		{ "<leader>n", group = "Neotree" },
	-- 		{ "<leader>nt", "<CMD>Neotree toggle<CR>", desc = "Toggle Neotree" },
	-- 	})
	-- end,
}
