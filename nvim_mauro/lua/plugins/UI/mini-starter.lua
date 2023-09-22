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
			query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
			items = {
				{ action = "Oil", name = "-: CWD", section = "Start here" },
				{ action = "Telescope oldfiles", name = "R: Recent files", section = "Start here" },
				{ action = "Oil /home/mauromotion/.dotfiles/", name = "D: Dotfiles", section = "Start here" },
				{ action = "VimwikiIndex", name = "V: VimWiki", section = "Start here" },
				{ action = "VimwikiDiaryIndex", name = "J: VimWikiDiary", section = "Start here" },
        { action = "Lazy check", name = "L: Lazy", section = "System" },
        { action = "Mason", name = "M: Mason", section = "System" },
        { action = "checkhealth", name = "H: Health", section = "System" },
        { action = "Oil /home/mauromotion/.config/nvim_mauro/", name = "C: Configuration", section = "System" },
				{ action = "enew", name = "E: New Buffer", section = "Builtin actions" },
				{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
			},
		})
	end,
}
