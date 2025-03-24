return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		-- lint.linters.ruff = {
		-- 	init_options = {
		-- 		settings = {
		-- 			logLevel = "debug",
		-- 		},
		-- 	},
		-- 	cmd = "ruff",
		-- 	args = { "check", "--format", "default", "--config=pyproject.toml", "-" },
		-- 	stdin = true, -- send file contents via stdin
		-- 	append_fname = false, -- filename is already handled by the '-' argument
		-- 	stream = "stdout",
		-- 	ignore_exitcode = true, -- so non-zero exit codes (due to lint errors) don't break linting
		-- 	parser = require("lint.parser").from_pattern(
		-- 		"^(%S+):(%d+):(%d+):%s+(%w+):%s+(.*)$", -- pattern capturing: file, line, col, severity, message
		-- 		{ "file", "lnum", "col", "code", "message" },
		-- 		{
		-- 			E = vim.diagnostic.severity.ERROR,
		-- 			W = vim.diagnostic.severity.WARN,
		-- 			I = vim.diagnostic.severity.INFO,
		-- 		}
		-- 	),
		-- }

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			astro = { "eslint_d" },
			python = { "ruff" },
			htmlpython = { "djlint" },
			-- markdown = { "markdownlint-cli2" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>li", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
