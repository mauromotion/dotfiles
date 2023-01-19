------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dot***REMOVED***les * --
-- Neovim -- lualine.lua --------------------------------

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''***REMOVED***,
    section_separators = { left = '', right = ''***REMOVED***,
    disabled_***REMOVED***letypes = {
      statusline = {***REMOVED***,
      winbar = {***REMOVED***,
    ***REMOVED***,
    ignore_focus = {***REMOVED***,
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    ***REMOVED***
  ***REMOVED***,
  sections = {
    lualine_a = {'mode'***REMOVED***,
    lualine_b = {'branch', 'diff', 'diagnostics'***REMOVED***,
    lualine_c = {'***REMOVED***lename'***REMOVED***,
    lualine_x = {'encoding', '***REMOVED***leformat', '***REMOVED***letype'***REMOVED***,
    lualine_y = {'progress'***REMOVED***,
    lualine_z = {'location'***REMOVED***
  ***REMOVED***,
  inactive_sections = {
    lualine_a = {***REMOVED***,
    lualine_b = {***REMOVED***,
    lualine_c = {'***REMOVED***lename'***REMOVED***,
    lualine_x = {'location'***REMOVED***,
    lualine_y = {***REMOVED***,
    lualine_z = {***REMOVED***
  ***REMOVED***,
  tabline = {***REMOVED***,
  winbar = {***REMOVED***,
  inactive_winbar = {***REMOVED***,
  extensions = {***REMOVED***
***REMOVED***
