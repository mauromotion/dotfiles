return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				astro = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				htmldjango = {
					{
						exe = "djlint",
						args = { "--reformat" },
						stdin = true,
					},
				},
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				json = { "prettierd" },
				lua = { "stylua" },
				markdown = { "prettierd" },
				sh = { "shfmt" },
				python = {
					"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				yaml = { "prettierd" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
