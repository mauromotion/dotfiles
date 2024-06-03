return {
	"echasnovski/mini.comment",
	event = "VeryLazy",
	version = false,
	config = function()
		require("mini.comment").setup({ options = {
			ignore_blank_line = true,
		} })
	end,
}
