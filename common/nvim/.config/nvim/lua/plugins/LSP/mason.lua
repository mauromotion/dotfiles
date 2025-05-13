return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- "jayp0521/mason-null-ls.nvim",
	},
	config = function()
		-- load mason
		local mason = require("mason")

		-- load mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- load mason-null-ls
		-- local mason_null_ls = require("mason-null-ls")

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
				"astro",
				"bashls",
				"cssls",
				"emmet_language_server",
				"html",
				"jedi_language_server",
				"jinja_lsp",
				"jsonls",
				"lua_ls",
				"marksman",
				"ruff",
				"sqlls",
				"tailwindcss",
				"taplo",
				"ts_ls",
				"yamlls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"djlint", -- Django linter and formatter
				"eslint_d", -- JavaScript linter
				"kulala-fmt", -- http linter and formatter
				"markdownlint-cli2", -- Markdown linter
				"prettierd", -- Prettier formatter
				"ruff", -- Python linter and formatter
				"shfmt", -- Shell formatter
				"stylua", -- Lua formatter
			},
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
