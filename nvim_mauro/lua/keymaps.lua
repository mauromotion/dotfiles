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
map("n", "<leader>sl", "<CMD>SessionLoad<CR>")

-- Fast saving, fast quitting
map("n", "<leader>w", "<CMD>:w<CR>")
map("n", "<leader>q", "<CMD>:q<CR>")

-- Keybindings for telescope
map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader><space>", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")
map("n", "<leader>co", "<CMD>HighlightColorsToggle<CR>")

-- Keybindings for NvimTree
-- map("n", "<C-b>", "<CMD>NvimTreeToggle<CR>")

-- Split views
map("n", "<leader>|", "<C-W>v")
map("n", "<leader>-", "<C-W>s")

-- Move current line / block with Alt-j/k ala vscode (Insert mode).
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Move current line / block with Alt-j/k ala vscode (Visual mode).
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Move current line / block with Alt-j/k ala vscode (Visual Block mode).
map("x", "<A-j>", ":move '>+1<CR>gv=gv")
map("x", "<A-k>", ":move '<-2<CR>gv=gv")

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

-- Visual mode -- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Keep centered while half page up/Down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep centered while scrolling search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Keep pasting the same with leader + p
map("x", "<leader>p", '"_dP')

-- Oil.Nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- mini.files
-- map("n", "-", "<CMD>lua MiniFiles.open()")

-- Harpoon
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

map("n", "<leader>hh", ui.toggle_quick_menu)
map("n", "<leader>ha", mark.add_file)
map("n", "<leader>hr", mark.rm_file)
map("n", "<leader>hn", ui.nav_next)
map("n", "<leader>hp", ui.nav_prev)

-- map("n", "h['1']>", function()
-- 	ui.nav_file(1)
-- end)
-- map("n", "h['2']>", function()
-- 	ui.nav_file(2)
-- end)
-- map("n", "h['3']>", function()
-- 	ui.nav_file(3)
-- end)
-- map("n", "h['4']>", function()
-- 	ui.nav_file(4)
-- end)

-- UndoTree
map("n", "<leader>ut", "<cmd>UndotreeToggle<cr>")

-- Zen Mode
map("n", "<leader>z", "<cmd>ZenMode<cr>")

-- Nvim-tmux-navigation
vim.cmd([[
  noremap <silent> <c-h> :<C-U>NvimTmuxNavigateLeft<cr>
  noremap <silent> <c-j> :<C-U>NvimTmuxNavigateDown<cr>
  noremap <silent> <c-k> :<C-U>NvimTmuxNavigateUp<cr>
  noremap <silent> <c-l> :<C-U>NvimTmuxNavigateRight<cr>
  noremap <silent> <c-\\> :<C-U>NvimTmuxNavigateLastActive<cr>
  noremap <silent> <c-Space> :<C-U>NvimTmuxNavigateNext<cr>
]])
