return {
	"stevearc/oil.nvim",
	event = "VimEnter",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			columns = {
				-- "mtime",
				-- "size",
				"icon",
			},
			win_options = {
				signcolumn = "yes:2",
			},
		})
		-- Keybindings
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true, desc = "Open parent directory" })
	end,
}
