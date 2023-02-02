require('gitsigns').setup {
  signs = {
    add          = { text = '│' ***REMOVED***,
    change       = { text = '│' ***REMOVED***,
    delete       = { text = '_' ***REMOVED***,
    topdelete    = { text = '‾' ***REMOVED***,
    changedelete = { text = '~' ***REMOVED***,
    untracked    = { text = '┆' ***REMOVED***,
  ***REMOVED***,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_***REMOVED***les = true
  ***REMOVED***,
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  ***REMOVED***,
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_***REMOVED***le_length = 40000, -- Disable if ***REMOVED***le is longer than this (in lines)
  preview_con***REMOVED***g = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  ***REMOVED***,
  yadm = {
    enable = false
  ***REMOVED***,
***REMOVED***
