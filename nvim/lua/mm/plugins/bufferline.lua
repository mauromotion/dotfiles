local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise ***REMOVED***): string,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicatoricon = "▎",
    buffer_close_icon = "",
    -- buffer_close_icon = '',
    modi***REMOVED***ed_icon = "●",
    close_icon = "",
    -- close_icon = '',
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be ***REMOVED***xed.
    -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --   -- remove extension from markdown ***REMOVED***les for example
    --   if buf.name:match('%.md') then
    --     return vim.fn.fnamemodify(buf.name, ':t:r')
    --   end
    -- end,
    max_name_length = 30,
    max_pre***REMOVED***x_length = 30, -- pre***REMOVED***x used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_***REMOVED***lter = function(buf_number)
    --   -- ***REMOVED***lter out ***REMOVED***letypes you don't want to see
    --   if vim.bo[buf_number].***REMOVED***letype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- ***REMOVED***lter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- ***REMOVED***lter out based on arbitrary rules
    --   -- e.g. ***REMOVED***lter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].***REMOVED***letype ~= "wiki" then
    --     return true
    --   end
    -- end,
    offsets = { { ***REMOVED***letype = "NvimTree", text = "", padding = 1 ***REMOVED*** ***REMOVED***,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' ***REMOVED***
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' ***REMOVED***,
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modi***REMOVED***ed > buffer_b.modi***REMOVED***ed
    -- end
  ***REMOVED***,
  highlights = {
***REMOVED***ll = {
      fg = { attribute = "fg", highlight = "#ff0000" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,
    background = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,

    buffer_selected = {
         fg = {attribute='fg',highlight='#ff0000'***REMOVED***,
         bg = {attribute='bg',highlight='#0000ff'***REMOVED***,
         underline = false, italic = true
       ***REMOVED***,
    buffer_visible = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,

    close_button = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,
    close_button_visible = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,
    -- close_button_selected = {
    --   fg = {attribute='fg',highlight='TabLineSel'***REMOVED***,
    --   bg ={attribute='bg',highlight='TabLineSel'***REMOVED***
    --   ***REMOVED***,

    tab_selected = {
      fg = { attribute = "fg", highlight = "Normal" ***REMOVED***,
      bg = { attribute = "bg", highlight = "Normal" ***REMOVED***,
    ***REMOVED***,
    tab = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,
    tab_close = {
      -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'***REMOVED***,
      fg = { attribute = "fg", highlight = "TabLineSel" ***REMOVED***,
      bg = { attribute = "bg", highlight = "Normal" ***REMOVED***,
    ***REMOVED***,

    duplicate_selected = {
      fg = { attribute = "fg", highlight = "TabLineSel" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLineSel" ***REMOVED***,
      italic = true,
    ***REMOVED***,
    duplicate_visible = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
      italic = true,
    ***REMOVED***,
    duplicate = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
      italic = true,
    ***REMOVED***,

    modi***REMOVED***ed = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,
    modi***REMOVED***ed_selected = {
      fg = { attribute = "fg", highlight = "Normal" ***REMOVED***,
      bg = { attribute = "bg", highlight = "Normal" ***REMOVED***,
    ***REMOVED***,
    modi***REMOVED***ed_visible = {
      fg = { attribute = "fg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,

    separator = {
      fg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
      bg = { attribute = "bg", highlight = "TabLine" ***REMOVED***,
    ***REMOVED***,
    separator_selected = {
      fg = { attribute = "bg", highlight = "Normal" ***REMOVED***,
      bg = { attribute = "bg", highlight = "Normal" ***REMOVED***,
    ***REMOVED***,
    -- separator_visible = {
    --   fg = {attribute='bg',highlight='TabLine'***REMOVED***,
    --   bg = {attribute='bg',highlight='TabLine'***REMOVED***
    --   ***REMOVED***,
    indicator_selected = {
      fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" ***REMOVED***,
      bg = { attribute = "bg", highlight = "Normal" ***REMOVED***,
    ***REMOVED***,
  ***REMOVED***,
***REMOVED***

