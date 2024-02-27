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
		local wk = require("which-key")

		--== Requires "which-key" plugin ==--
		wk.register({
			f = {
				name = "Telescope",
				f = { "<CMD>Telescope find_files<CR>", "Fuzzy find files in cwd" },
				r = { "<CMD>Telescope oldfiles<CR>", "Fuzzy find recent files" },
				g = { "<CMD>Telescope live_grep<CR>", "Find string in cwd" },
				s = { "<CMD>Telescope grep_string<CR>", "Find string under cursor in cwd" },
				v = { "<CMD>Telescope vimwiki<CR>", "Find VimWiki pages" },
				w = { "<CMD>Telescope vimwiki live_grep<CR>", "Live Grep inside VimWiki" },
				a = { "<CMD>Telescope aerial<CR>", "Find symbols with Aerial" },
			},
			["<Space>"] = {
				function()
					require("telescope.builtin").buffers({ sort_lastused = true })
				end,
				"List open buffers",
			},
		}, { prefix = "<leader>" })

		--== Vanilla keymapping ==--
		-- local map = vim.keymap
		--
		-- map.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		-- map.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		-- map.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
		-- map.set("n", "<leader>fs", "<CMD>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
		-- map.set("n", "<leader>fv", "<CMD>Telescope vimwiki<CR>", { desc = "Find VimWiki pages" })
		-- map.set("n", "<leader>fw", "<CMD>Telescope vimwiki live_grep<CR>", { desc = "Live Grep inside VimWiki" })
		-- map.set("n", "<leader>fa", "<CMD>Telescope aerial<CR>", { desc = "Find symbols with Aerial" })
		-- map.set("n", "<leader><space>", function()
		-- 	require("telescope.builtin").buffers({ sort_lastused = true })
		-- end, { desc = "List open buffers" })
	end,
}
