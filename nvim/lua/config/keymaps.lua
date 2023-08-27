-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local wk = require("which-key")

-- Harpoon
-- local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-1>", function()
  ui.nav_file(1)
end)
vim.keymap.set("n", "<C-2>", function()
  ui.nav_file(2)
end)
vim.keymap.set("n", "<C-3>", function()
  ui.nav_file(3)
end)
vim.keymap.set("n", "<C-4>", function()
  ui.nav_file(4)
end)

-- UndoTree
-- vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)

wk.register({
  ["<leader>"] = {
    h = {
      name = "Harpoon",
      h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "quick Menu" },
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
      r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "remove file" },
      n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next file" },
      p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous file" },
    },
  },
  ["<leader>ut"] = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
  ["<leader>z"] = { "<cmd>ZenMode<cr>", "ZenMode" },
})
