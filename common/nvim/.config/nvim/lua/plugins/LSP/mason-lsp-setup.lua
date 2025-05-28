-- INFO:List of formatters to install via Mason
local formatters = {
	"prettierd", -- Prettier formatter
	"ruff", -- Python linter and formatter
	"shfmt", -- Shell formatter
	"stylua", -- Lua formatter
}
-- INFO:List of linters to install via Mason
local linters = {
	"djlint", -- Django linter and formatter
	"eslint_d", -- JavaScript linter
	"kulala-fmt", -- http linter and formatter
	"markdownlint-cli2", -- Markdown linter
}
-- INFO:List of language servers to install & setup via Mason.
-- NOTE: These should be nvim-lspconfig server names that are *also* supported by Mason for automatic server setup.
-- Any and all server settings are overriden via the lsp/ folder.
local language_servers = {
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
} -- WARN: All non-mason language servers need to be setup manually and differently as shown above.
local allMasonPkgs = vim.iter({ language_servers, linters, formatters }):flatten():totable()

return {
	{
		"whoissethdaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
		opts = { ensure_installed = allMasonPkgs },
	},

	-- INFO:This plugin bridges the gap between installed LSP's via Mason and their configuration as provided by nvim-lspconfig.
	-- From Mason 2.0 and nvim 0.11 onwards, this plugin will automatically enable all installed servers via vim.lsp.enable
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
			},
		},
		opts = {},
	},
}
