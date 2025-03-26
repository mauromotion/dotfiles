return {
	"vimwiki/vimwiki",
	cmd = "VimwikiIndex",
	-- branch = "dev",
	init = function()
		-- Default directory, syntax and file type, symbols for spaces, auto re-index tags db
		vim.g.vimwiki_list = {
			{
				path = "~/Nextcloud/03_Resources/Notes/Nextcloud_Notes/",
				syntax = "markdown",
				ext = ".md",
				links_space_char = "_",
				vimwiki_global_ext = 0,
				auto_tags = 1,
				auto_diary_index = 1,
				-- vimwiki_folding = "custom",
			},
		}

		-- Disable header levels keybindings so oil.nvim will work
		vim.g.vimwiki_key_mappings = {
			headers = 0,
		}

		-- Syntax highlighting for code blocks
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
	end,
	-- dependencies = {
	-- 	"tools-life/taskwiki",
	-- 	init = function()
	-- 		vim.g.taskwiki_dont_preserve_folds = "yes"
	-- 		vim.g.taskwiki_dont_fold = "yes"
	-- 	end,
	-- },
}
