return {
	"echasnovski/mini.starter",
  event = "VimEnter",
	version = false,
	config = function()
		require("mini.starter").setup()
	end,
}
