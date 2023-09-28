--* Initialize lazy.nvim package manager *--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

-- VimWiki setup // Here's the only place where it loads...

-- Set VimWiki deafult directory
vim.g.vimwiki_list = { { path = "~/Notes/VimWiki", syntax = "markdown", ext = ".md", links_space_char = "_" } }

-- Set VimWiki syntax highlighting for code blocks
vim.g.vimwiki_syntax_plugins = {
	codeblock = {
		["```lua"] = { parser = "lua" },
		["```python"] = { parser = "python" },
		["```javascript"] = { parser = "javascript" },
		["```bash"] = { parser = "bash" },
		["```html"] = { parser = "html" },
		["```css"] = { parser = "css" },
		["```c"] = { parser = "c" },
	},
}

-- Load Plugins --
require("lazy").setup({
	{ import = "plugins.coding" },
	{ import = "plugins.LSP" },
	{ import = "plugins.navigation" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.UI" },
	{ import = "plugins.utilities" },
})
