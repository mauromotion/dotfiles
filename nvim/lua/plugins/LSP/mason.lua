return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		-- load mason
		local mason = require("mason")

		-- load mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- load mason-null-ls
		local mason_null_ls = require("mason-null-ls")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"html",
				"cssls",
				"emmet_language_server",
				"jedi_language_server",
				"ruff_lsp",
				"marksman",
				"jsonls",
				"yamlls",
				"sqlls",
				"bashls",
				"astro",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				"prettierd", -- ts/js formatter
				"stylua", -- lua formatter
				"shfmt", -- shell script formatter
				-- "flake8", -- python linter
				"black", -- python type formatter
				"isort", -- python type formatter
				"djlint", -- django templates linter
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})

		-- Keybindings
		vim.keymap.set(
			"n",
			"<leader>m",
			"<CMD>Mason<CR>",
			{ noremap = true, silent = true, desc = "Mason LSP Manager" }
		)
	end,
}
