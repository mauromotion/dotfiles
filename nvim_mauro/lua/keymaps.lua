------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- Neovim -- maps.lua --------------------------------

-- KEYBINDINGS

local function map(m, k, v, opts)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- Fast saving, fast quitting
map("n", "<leader>w", "<CMD>:w<CR>", { desc = "Fast saving [W]" })
map("n", "<leader>q", "<CMD>:q<CR>", { desc = "Fast [Q]uitting" })

-- Split views
map("n", "<leader>|", "<C-W>v", { desc = "Split view vertically | " })
map("n", "<leader>-", "<C-W>s", { desc = "Split view horizontally - " })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

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

------* Plugins' keymaps *------

-- Lazy
map("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "Launch [L]azy Plugin Manager" })

-- Mason
map("n", "<leader>m", "<CMD>Mason<CR>", { desc = "Launch [M]ason LSP Manager" })

-- Higlight Colors
map("n", "<leader>ch", "<CMD>HighlightColorsToggle<CR>", { desc = "Toggle [C]olors [H]ighlighter" })

-- Oil.Nvim
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- mini.files
-- map("n", "-", "<CMD>lua MiniFiles.open()")

-- Harpoon
-- local ui = require("harpoon.ui")
-- local mark = require("harpoon.mark")
--
-- map("n", "<leader>hh", ui.toggle_quick_menu)
-- map("n", "<leader>ha", mark.add_file)
-- map("n", "<leader>hr", mark.rm_file)
-- map("n", "<leader>hn", ui.nav_next)
-- map("n", "<leader>hp", ui.nav_prev)

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
map("n", "<leader>ut", "<cmd>UndotreeToggle<cr>", { desc = "Toggle [U]ndo[T]ree" })

-- Zen Mode
map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle [Z]en mode" })

-- Nvim-tmux-navigation
vim.cmd([[
  noremap <silent> <c-h> :<C-U>NvimTmuxNavigateLeft<cr>
  noremap <silent> <c-j> :<C-U>NvimTmuxNavigateDown<cr>
  noremap <silent> <c-k> :<C-U>NvimTmuxNavigateUp<cr>
  noremap <silent> <c-l> :<C-U>NvimTmuxNavigateRight<cr>
  noremap <silent> <c-\\> :<C-U>NvimTmuxNavigateLastActive<cr>
  noremap <silent> <c-Space> :<C-U>NvimTmuxNavigateNext<cr>
]])
