------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- Neovim -- maps.lua --------------------------------

-- KEYBINDINGS

local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- Load recent sessions
map('n', '<leader>sl', '<CMD>SessionLoad<CR>')

-- Keybindings for telescope
map('n', '<leader>fr', '<CMD>Telescope oldfiles<CR>')
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fb', '<CMD>Telescope file_browser<CR>')
map('n', '<leader>fw', '<CMD>Telescope live_grep<CR>')
map('n', '<leader>ht', '<CMD>Telescope colorscheme<CR>')

-- Keybindings for NvimTree
map('n', '<C-b>', '<CMD>NvimTreeToggle<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')

-- Move current line / block with Alt-j/k ala vscode (Insert mode).
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
map('i','<A-k>', '<Esc>:m .-2<CR>==gi')

-- Move current line / block with Alt-j/k ala vscode (Visual mode).
map('v', '<A-j>', ":m '>+1<CR>gv-gv")
map('v', '<A-k>', ":m '<-2<CR>gv-gv")

-- Move current line / block with Alt-j/k ala vscode (Visual Block mode).
map('x', '<A-j>', ":move '>+1<CR>gv-gv")
map('x', '<A-k>', ":move '<-2<CR>gv-gv")

-- Navigation
map('i', '<A-Up>', '<C-\\><C-N><C-w>k')
map('i', '<A-Down>', '<C-\\><C-N><C-w>j')
map('i', '<A-Left>', '<C-\\><C-N><C-w>h')
map('i', '<A-Right>', '<C-\\><C-N><C-w>l')

-- Better window movement
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Resize with arrows
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Navigate buffers
map('n', '<S-l>', ':bnext<CR>')
map('n', '<S-h>', ':bprevious<CR>')

-- Visual mode -- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

