return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"",
					"",
					"███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄",
					"███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄",
					"███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███",
					"███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███",
					"███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███",
					"███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███",
					"███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███",
					" ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀",
					"",
					" [ TIP: To exit Neovim, just power off your computer. ] ",
					"",
				},
				center = {
					{
						icon = " ",
						icon_hl = "Title",
						desc = "Find File           ",
						desc_hl = "String",
						key = "b",
						keymap = "SPC f f",
						key_hl = "Number",
						action = "lua print(2)",
					},
					{
						icon = " ",
						desc = "Find Dotfiles",
						key = "f",
						keymap = "SPC f d",
						action = "lua print(3)",
					},
					{
						icon = " ",
						desc = "Find Dotfiles",
						key = "f",
						keymap = "SPC f d",
						action = "lua print(3)",
					},
					{
						icon = " ",
						desc = "Find Dotfiles",
						key = "f",
						keymap = "SPC f d",
						action = "lua print(3)",
					},
				},
				packages = { enable = true }, -- show how many plugins neovim loaded
				footer = { "  2023: The year of Linux on Desktop.  " }, --your footer
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
