return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.g.mkdp_filetypes = { "markdown", "vimwiki" }
		vim.fn["mkdp#util#install"]()
	end,
}
