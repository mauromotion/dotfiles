return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "love", "awesome", "screen" },
			},
			completion = {
				callSnippet = "Replace",
			},

			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					"${3rd}/luv/library",
					-- "${3rd}/busted/library",
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				diagnostics = {
					disable = { "missing-fields" },
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
