---- ** Zenbones ** ----
return {
	"zenbones-theme/zenbones.nvim",
	dependencies = "rktjmp/lush.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- vim.g.zenbones_lightness = "dim"
		-- vim.g.zenwritten_darken_comments = 45
		-- vim.g.zenwritten_darkness = "stark"
		vim.cmd.colorscheme("zenbones")
	end,
}
