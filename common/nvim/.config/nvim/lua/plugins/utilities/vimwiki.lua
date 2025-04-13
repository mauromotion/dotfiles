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

		-- VimWiki + FZF-lua integration
		-- Get the vimwiki path
		local function get_wiki_path()
			local path = vim.g.vimwiki_list and vim.g.vimwiki_list[1].path or vim.fn.expand("~/vimwiki/")
			-- Ensure path ends with slash
			if path:sub(-1) ~= "/" then
				path = path .. "/"
			end
			return path
		end

		-- Function to properly open a vimwiki file
		local function open_wiki_file(file_path)
			-- Extract just the filename without the path
			local filename = file_path:match("([^/]+)$")

			-- Remove file extension (.md or .wiki) - VimwikiGoto adds it automatically
			filename = filename:gsub("%.md$", ""):gsub("%.wiki$", "")

			-- Exit fzf-lua UI first
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)

			vim.defer_fn(function()
				-- Chain the vimwiki commands as specified
				vim.cmd("VimwikiIndex")
				vim.cmd("VimwikiGoto " .. vim.fn.fnameescape(filename))
			end, 100)
		end

		-- Search files in vimwiki directory
		vim.keymap.set("n", "<Leader>fw", function()
			local wiki_path = get_wiki_path()

			require("fzf-lua").files({
				prompt = "Wiki Files> ",
				cwd = wiki_path,
				cmd = "find . -type f -name '*.md' -o -name '*.wiki'", -- Explicitly find vimwiki files
				actions = {
					["default"] = function(selected)
						if selected and #selected > 0 then
							-- Get the relative filename (remove leading ./)
							local filename = selected[1]:gsub("^%./", "")
							local full_path = wiki_path .. filename
							open_wiki_file(full_path)
						end
					end,
				},
			})
		end, { desc = "Search vimwiki files" })
	end,
	-- dependencies = {
	-- 	"tools-life/taskwiki",
	-- 	init = function()
	-- 		vim.g.taskwiki_dont_preserve_folds = "yes"
	-- 		vim.g.taskwiki_dont_fold = "yes"
	-- 	end,
	-- },
	--
	--
}
