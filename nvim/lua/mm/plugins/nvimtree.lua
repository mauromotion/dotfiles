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

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('NVIM_TREE', { clear = true ***REMOVED***),
    pattern = 'NvimTree',
    callback = function()
        vim.api.nvim_win_set_option(0, 'wrap', false)
    end,
***REMOVED***)

-- Autoclose
local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbu***REMOVED***nfo(bufnr)[1]
  local tab_wins = vim.tbl_***REMOVED***lter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  ***REMOVED***                                                      -- ***REMOVED*** closed buffer was normal buffer
    if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbu***REMOVED***nfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
        vim.schedule(function ()
          if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            vim.cmd "quit"                                        -- then close all of vim
      ***REMOVED***                                                  -- ***REMOVED*** there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function ()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true
***REMOVED***)
