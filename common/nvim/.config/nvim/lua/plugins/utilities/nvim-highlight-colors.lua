return {
	"brenoprata10/nvim-highlight-colors",
	event = "VeryLazy",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "background",
			enable_tailwind = true,
			exclude_filetypes = { "nofile" },
			exclude_buftypes = { "nofile" },
		})
	end,
}
