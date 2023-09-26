return {
	"stevearc/oil.nvim",
  event = "VimEnter",
	config = function()
		require("oil").setup()
	end,
}
