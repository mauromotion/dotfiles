return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	-- cmd = "Telescope",
	-- version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"ElPiloto/telescope-vimwiki.nvim",
		{
			"nvim-telescope/telescope-ui-select.nvim",
			config = function()
				require("telescope").setup({
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({
								-- even more opts
							}),

							-- pseudo code / specification for writing custom displays, like the one
							-- for "codeactions"
							-- specific_opts = {
							--   [kind] = {
							--     make_indexed = function(items) -> indexed_items, width,
							--     make_displayer = function(widths) -> displayer
							--     make_display = function(displayer) -> function(e)
							--     make_ordinal = function(e) -> string
							--   },
							--   -- for example to disable the custom builtin "codeactions" display
							--      do the following
							--   codeactions = false,
							-- }
						},
					},
				})
			end,
		},
	},
	config = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("vimwiki")
		require("telescope").load_extension("aerial")
		require("telescope").load_extension("ui-select")

		-- Keymaps
		local map = vim.keymap

		map.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		map.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Fuzzy [f]ind [r]ecent files" })
		map.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "[F]ind strin[g] in cwd" })
		map.set("n", "<leader>fs", "<CMD>Telescope grep_string<CR>", { desc = "[F]ind [s]tring under cursor in cwd" })
		map.set("n", "<leader>fv", "<CMD>Telescope vimwiki<CR>", { desc = "[F]ind [V]imWiki pages" })
		map.set("n", "<leader>fw", "<CMD>Telescope vimwiki live_grep<CR>", { desc = "Live Grep inside Vim[W]iki" })
		map.set("n", "<leader>fa", "<CMD>Telescope aerial<CR>", { desc = "[F]ind symbols with [A]erial" })
		map.set("n", "<leader><space>", function()
			require("telescope.builtin").buffers({ sort_lastused = true })
		end, { desc = "[F]ind open [B]uffers" })
	end,
}
