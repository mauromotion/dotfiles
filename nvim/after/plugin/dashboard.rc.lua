------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- Neovim -- Dashboard-nvim -- plugin config ---------


local status, db = pcall(require, "dashboard")
local home = os.getenv("HOME")

db.setup({
  theme = 'hyper',
  config = {
    header = {
"",
"",
"███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄",
"███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄",
"███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███",
"███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███",
"███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███",
"███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███",
"███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███",
" ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀",
"",
    " [ TIP: To exit Neovim, just power off your computer. ] ",
    "",
    },
    shortcut = {
        { desc = ' Update',
          group = '@property',
          action = 'PackerUpdate',
          key = 'u' },
        {
          desc = ' Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Health',
          group = 'DiagnosticHint',
          action = 'checkhealth',
          key = 'h',
        },
        {
          desc = ' Mason',
          group = 'Number',
          action = 'Mason',
          key = 'm',
        },
      },
    packages = { enable = true }, -- show how many plugins neovim loaded
    project = { limit = 8, action = 'Telescope find_files cwd=' }, -- limit how many projects list, action when you press key or enter it will run this action.
    mru = { limit = 10 }, -- how many files in list
    footer = {"", "  2023: The year of Linux on Desktop.  " }
  }
})

