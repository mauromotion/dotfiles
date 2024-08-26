return {
	"folke/zen-mode.nvim",
	opts = {
		plugins = {
			options = {
				laststatus = 0,
			},
			alacritty = {
				enabled = true,
			},
			wezterm = {
				enabled = true,
				font = "+2",
			},
			kitty = {
				enabled = true,
				font = "+4",
			},
			tmux = {
				enabled = true,
			},
		},
	},
	keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode Toggle" } },
}
