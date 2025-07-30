-- ** LSP & tools setup ** --

-- List of formatters and linters to install via Mason
local tools = {
	"prettierd", -- Prettier formatter
	"ruff", -- Python linter and formatter
	"shfmt", -- Shell formatter
	"stylua", -- Lua formatter
	"djlint", -- Django linter and formatter
	"eslint_d", -- JavaScript linter
	"kulala-fmt", -- http linter and formatter
	"markdownlint-cli2", -- Markdown linter
}

-- List of language servers to install & setup via Mason.
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
	-- "tailwindcss",
	"taplo",
	"ts_ls",
	"yamlls",
}

-- Merge in the same list lsps and tools
local allMasonPkgs = vim.iter({ language_servers, tools }):flatten():totable()

return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"whoissethdaniel/mason-tool-installer.nvim",
				dependencies = {},
				opts = { ensure_installed = allMasonPkgs },
			},
			{
				"neovim/nvim-lspconfig",
				config = function()
					-- Diagnostic signs
					local x = vim.diagnostic.severity
					vim.diagnostic.config({
						virtual_text = false,
						signs = {
							text = {
								[x.ERROR] = " ",
								[x.WARN] = " ",
								[x.INFO] = " ",
								[x.HINT] = "󰠠 ",
							},
						},
						underline = true,
					})
				end,
			},
		},
	},
}
