------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dot***REMOVED***les * --
-- Neovim -- Dashboard-nvim -- plugin con***REMOVED***g ---------


local status, db = pcall(require, "dashboard")
local home = os.getenv("HOME")

db.setup({
  theme = 'hyper',
  con***REMOVED***g = {
    header = {
    "",
    "",
    " ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
    " ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
    "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
    "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██",
    "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
    "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
    "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
    "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░",
    "         ░    ░  ░    ░ ░        ░   ░         ░",
    "                                ░",
    "",
    " [ TIP: To exit Neovim, just power off your computer. ] ",
    "",
    ***REMOVED***,
  shortcut = {
        { desc = ' Update', 
          group = '@property', 
          action = 'PackerUpdate', 
          key = 'u' ***REMOVED***,
        {
          desc = ' Files',
          group = 'Label',
          action = 'Telescope ***REMOVED***nd_***REMOVED***les',
          key = 'f',
        ***REMOVED***,
        {
          desc = ' Health',
          group = 'DiagnosticHint',
          action = 'checkhealth',
          key = 'a',
        ***REMOVED***,
        {
          desc = ' dot***REMOVED***les',
          group = 'Number',
          action = 'Telescope dot***REMOVED***les',
          key = 'd',
        ***REMOVED***, 
  ***REMOVED***,
  packages = { enable = true ***REMOVED***, -- show how many plugins neovim loaded
  project = { limit = 8, action = 'Telescope ***REMOVED***nd_***REMOVED***les cwd=' ***REMOVED***, -- limit how many projects list, action when you press key or enter it will run this action.
  mru = { limit = 10 ***REMOVED***, -- how many ***REMOVED***les in list
  footer = {'', '  2023: The year of Linux on Desktop! (WSL)   ' ***REMOVED***, 
***REMOVED******REMOVED***)

