return {
	"echasnovski/mini.starter",
	event = "VimEnter",
	version = false,
	config = function()
		require("mini.starter").setup({
			content_hooks = {
				require("mini.starter").gen_hook.adding_bullet(""),
				require("mini.starter").gen_hook.aligning("center", "center"),
			},
			evaluate_single = true,
			footer = os.date(),
			header = table.concat({
				[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
				[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
				[[/ /\  /  __/ (_) \ V /| | | | | | |]],
				[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
				[[───────────────────────────────────]],
			}, "\n"),
			-- header = table.concat({
			-- 	[[                       o              ]],
			-- 	[[  _  _    _   __           _  _  _    ]],
			-- 	[[ / |/ |  |/  /  \_|  |_|  / |/ |/ |   ]],
			-- 	[[   |  |_/|__/\__/  \/  |_/  |  |  |_/ ]],
			-- }, "\n"),
			query_updaters = [[abcdefghijklmnoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMNOQRSTUVWXYZ]],
			items = {
				-- Start here
				{ action = "Oil", name = "- CWD", section = "Start here" },
				{ action = "Telescope live_grep", name = "Grep CWD", section = "Start here" },
				{ action = "Telescope oldfiles", name = "Recent files", section = "Start here" },
				{ action = "VimwikiIndex", name = "VimWiki", section = "Start here" },
				-- { action = "VimwikiDiaryIndex", name = "Journal VimWikiDiary", section = "Start here" },
				-- { action = "VimwikiMakeDiaryNote", name = "Today VimWikiDiary", section = "Start here" },
				-- Sessions
				require("mini.starter").sections.sessions(),
				-- System
				{ action = "Oil /home/mauromotion/.config/nvim/", name = "Configuration", section = "System" },
				{ action = "Oil /home/mauromotion/.dotfiles/", name = "Dotfiles", section = "System" },
				{ action = "checkhealth", name = "Health", section = "System" },
				{ action = "Lazy check", name = "Lazy", section = "System" },
				{ action = "Mason", name = "Mason", section = "System" },
				-- Builtin actions
				require("mini.starter").sections.builtin_actions(),
				-- { action = "enew", name = "New Buffer", section = "Builtin actions" },
				-- { action = "qall!", name = "Quit Neovim", section = "Builtin actions" },
				-- require('mini.starter').sections.telescope(),
				-- require('mini.starter').sections.recent_files(10, false, false)
			},
		})
	end,
}
