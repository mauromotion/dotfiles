------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- Neovim -- highlights.lua --------------------------------

-- Default Theme --

-- To set a default change the name of the theme here: 
local colorscheme = "nordfox"

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not status_ok then
  vim.notify('colorscheme ' .. ' not found!')
  return
end

-- Highlight the region on yank
local num_au = vim.api.nvim_create_augroup('nonvim', { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})

