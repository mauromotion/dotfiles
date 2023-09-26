return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	-- cmd = "Telescope",
	-- version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("telescope").load_extension("fzf")

		-- Keymaps
		local map = vim.keymap

		map.set("n", "<leader><space>", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		map.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Fuzzy [f]ind [r]ecent files" })
		map.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "[F]ind strin[g] in cwd" })
		map.set("n", "<leader>fs", "<CMD>Telescope grep_string<CR>", { desc = "[F]ind [s]tring under cursor in cwd" })
		map.set("n", "<leader>fb", function()
			require("telescope.builtin").buffers({ sort_lastused = true })
		end, { desc = "[F]ind open [B]uffers" })
	end,
}

-- TODO: bind 'TodoTelescope' to a key
