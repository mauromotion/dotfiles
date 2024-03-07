return {
	"stevearc/oil.nvim",
  event = "VimEnter",
	config = function()
		require("oil").setup()
    -- Keybindings
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true, desc = "Open parent directory" }
    )
	end,
}
