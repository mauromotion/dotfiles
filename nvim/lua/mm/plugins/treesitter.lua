-- [[ Con***REMOVED***gure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.con***REMOVED***gs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim', 'html', 'css', 'javascript', '***REMOVED***sh', 'bash', 'markdown', 'json', 'scss', 'yaml' ***REMOVED***,

  highlight = { enable = true ***REMOVED***,
  indent = { enable = true, disable = { 'python' ***REMOVED*** ***REMOVED***,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    ***REMOVED***,
  ***REMOVED***,
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups de***REMOVED***ned in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      ***REMOVED***,
    ***REMOVED***,
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      ***REMOVED***,
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      ***REMOVED***,
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      ***REMOVED***,
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      ***REMOVED***,
    ***REMOVED***,
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      ***REMOVED***,
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      ***REMOVED***,
    ***REMOVED***,
  ***REMOVED***,
***REMOVED***
