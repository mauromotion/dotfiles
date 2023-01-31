require('nvim-tree').setup({
    diagnostics = {
        enable = true,
    ***REMOVED***,
    update_focused_***REMOVED***le = {
        enable = true,
    ***REMOVED***,
    view = {
        width = 30,
        side = 'left',
        mappings = {
          custom_only = false,
          list = {
            {key = 'v', action = 'vsplit' ***REMOVED***,
        ***REMOVED***,
      ***REMOVED***,
    ***REMOVED***,
***REMOVED***lters = {
        custom = { '.git$', 'node_modules$', '^target$' ***REMOVED***,
    ***REMOVED***,
    git = {
        ignore = false,
    ***REMOVED***,
    actions = {
        open_***REMOVED***le = {
            window_picker = {
                enable = false,
            ***REMOVED***,
        ***REMOVED***,
    ***REMOVED***,
    renderer = {
        icons = {
            show = {
                git = true,
                folder = true,
            ***REMOVED***le = true,
                folder_arrow = false,
            ***REMOVED***,
            glyphs = {
                default = '',
                git = {
                    unstaged = '~',
                    staged = '+',
                    unmerged = '!',
                    renamed = '≈',
                    untracked = '?',
                    deleted = '-',
                ***REMOVED***,
            ***REMOVED***,
        ***REMOVED***,
        indent_markers = {
            enable = true,
        ***REMOVED***,
    ***REMOVED***,
***REMOVED***)

-- vim.keymap.set('n', 'v', '<CMD>vsplit<CR>')

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('NVIM_TREE', { clear = true ***REMOVED***),
    pattern = 'NvimTree',
    callback = function()
        vim.api.nvim_win_set_option(0, 'wrap', false)
    end,
***REMOVED***)
