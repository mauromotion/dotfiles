------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dot***REMOVED***les * --
-- Neovim -- maps.lua --------------------------------

-- KEYBINDINGS

local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true ***REMOVED***)
end

-- Keybindings for telescope
map("n", "<leader>fr", "<CMD>Telescope old***REMOVED***les<CR>")
map("n", "<leader>ff", "<CMD>Telescope ***REMOVED***nd_***REMOVED***les<CR>")
map("n", "<leader>fb", "<CMD>Telescope ***REMOVED***le_browser<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")

-- Keybindings for NERDTree
map("n", "<C-b>", "<CMD>NERDTreeToggle<CR>")
