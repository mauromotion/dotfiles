return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	event = "InsertEnter",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "normal",
			use_nvim_cmp_as_default = true,
		},
		completion = {
			menu = { border = "rounded" },
			documentation = { window = { border = "rounded" }, auto_show = true },
		},
		signature = { window = { border = "rounded" } },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
