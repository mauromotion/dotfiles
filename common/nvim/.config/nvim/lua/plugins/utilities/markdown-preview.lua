return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.g.mkdp_filetypes = { "markdown", "vimwiki" }
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		local wk = require("which-key")

		wk.add({
			{
				"<leader>cp",
				"<CMD>MarkdownPreviewToggle<CR>",
				ft = { "markdown", "vimwiki" },
				desc = "Toggle MarkdownPreview",
			},
		})
	end,
}
