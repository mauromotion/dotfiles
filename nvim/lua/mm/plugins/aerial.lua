require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '***REMOVED***'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr***REMOVED***)
    vim.keymap.set('n', '***REMOVED***', '<cmd>AerialNext<CR>', {buffer = bufnr***REMOVED***)
  end
***REMOVED***)
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>ae', '<cmd>AerialToggle!<CR>')
