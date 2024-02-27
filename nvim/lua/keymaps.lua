------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- Neovim -- maps.lua --------------------------------

-- KEYBINDINGS

local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { noremap = true, silent = true, desc = d })
end

-- Split views
map("n", "<leader>|", "<C-W>v", "Split view vertically")
map("n", "<leader>-", "<C-W>s", "Split view horizontally")

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", "Move line down")
map("n", "<A-k>", "<cmd>m .-2<cr>==", "Move line up")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", "Move line down")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", "Move line up")
map("v", "<A-j>", ":m '>+1<cr>gv=gv", "Move line down")
map("v", "<A-k>", ":m '<-2<cr>gv=gv", "Move line up")

-- Navigation
map("i", "<A-Up>", "<C-\\><C-N><C-w>k")
map("i", "<A-Down>", "<C-\\><C-N><C-w>j")
map("i", "<A-Left>", "<C-\\><C-N><C-w>h")
map("i", "<A-Right>", "<C-\\><C-N><C-w>l")

-- Better window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Delete (close) a buffer
map("n", "<leader>b", ":bdelete<CR>", "Delete buffer")

-- Visual mode -- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Keep centered while half page up/Down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep centered while scrolling search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Tab to alternate buffers
map("n", "<TAB>", "<C-^>")

-- Keep pasting the same with leader + p
-- map("x", "<leader>p", '"_dP')
