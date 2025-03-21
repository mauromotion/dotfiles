return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- snippets from the attached LSP
		"hrsh7th/cmp-cmdline", -- autocomplete commands
	},
	config = function()
		-- `/` cmdline setup.
		local cmp = require("cmp")

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references

			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>FzfLua lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "dp", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "dn", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwind server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = function(fname)
				local root_pattern = require("lspconfig").util.root_pattern(
					"tailwind.config.cjs",
					"tailwind.config.js",
					"postcss.config.js"
				)
				return root_pattern(fname)
			end,
		})

		-- configure emmet language server
		lspconfig["emmet_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"html",
				"htmldjango",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"svelte",
			},
		})

		-- configure markdown language server
		lspconfig["marksman"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "markdown", "vimwiki" },
		})

		-- configure toml server
		lspconfig["taplo"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure yaml server
		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure bash language server
		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure http language server
		lspconfig["kulala_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "http", "rest" },
		})

		-- configure sql language server
		lspconfig["sqlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure json language server
		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure yaml language server
		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["jedi_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "python" },
		})

		-- -- configure python linter and formatter
		-- lspconfig["ruff"].setup({
		-- 	cmd = { "ruff", "server" },
		-- 	filetypes = { "python" },
		-- 	init_options = {
		-- 		settings = {
		-- 			fixAll = true, -- Enable "fix all" (auto-fix) capability
		-- 			organizeImports = true,
		-- 			lint = { args = { "--config=pyproject.toml" } },
		-- 			logLevel = "debug", -- Optional: to help debug issues
		-- 		},
		-- 	},
		-- 	capabilities = capabilities,
		-- 	on_attach = function(client, bufnr)
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			buffer = bufnr,
		-- 			callback = function()
		-- 				vim.lsp.buf.format({
		-- 					async = false,
		-- 					filter = function(c)
		-- 						return c.name == "ruff"
		-- 					end,
		-- 				})
		-- 			end,
		-- 		})
		-- 	end,
		-- })

		-- configure django server
		lspconfig["jinja_lsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "htmldjango" },
		})

		-- configure astro server
		lspconfig["astro"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "astro" },
			typescript = {},
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim", "love", "awesome", "screen" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
		})
	end,

	-- 	-- Create a user command for organize imports
	-- 	vim.api.nvim_create_user_command("RuffOrganizeImports", function()
	-- 		vim.lsp.buf.code_action({
	-- 			context = { only = { "source.organizeImports.ruff" } },
	-- 			apply = true,
	-- 		})
	-- 	end, { desc = "Organize imports with Ruff" }),

	-- 	-- Optionally, bind the command to a key mapping (e.g., <leader>oi)
	-- 	vim.keymap.set("n", "<leader>oi", "<cmd>RuffOrganizeImports<CR>", {
	-- 		buffer = bufnr,
	-- 		desc = "Organize imports with Ruff",
	-- 	}),
}
