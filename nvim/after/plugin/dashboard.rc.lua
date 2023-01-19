------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dot***REMOVED***les * --
-- Neovim -- Dashboard-nvim -- plugin con***REMOVED***g ---------


local status, db = pcall(require, "dashboard")
local home = os.getenv("HOME")

db.default_banner = {
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
***REMOVED***
-- linux
--db.preview_command = 'ueberzug'
--
--db.preview_***REMOVED***le_path = home .. '/.con***REMOVED***g/nvim/static/neovim.cat'
db.preview_***REMOVED***le_height = 11
db.preview_***REMOVED***le_width = 70
db.custom_center = {
	{
		icon = "  ",
		desc = "Recent sessions                         ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	***REMOVED***,
	{
		icon = "  ",
		desc = "Find recent ***REMOVED***les                       ",
		action = "Telescope old***REMOVED***les",
		shortcut = "SPC f r",
	***REMOVED***,
	{
		icon = "  ",
		desc = "Find ***REMOVED***les                              ",
		action = "Telescope ***REMOVED***nd_***REMOVED***les ***REMOVED***nd_command=rg,--hidden,--***REMOVED***les",
		shortcut = "SPC f f",
	***REMOVED***,
	{
		icon = "  ",
		desc = "File browser                            ",
		action = "Telescope ***REMOVED***le_browser",
		shortcut = "SPC f b",
	***REMOVED***,
	{
		icon = "  ",
		desc = "Find word                               ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	***REMOVED***,
	{
		icon = "  ",
		desc = "Load new theme                          ",
		action = "Telescope colorscheme",
		shortcut = "SPC h t",
	***REMOVED***,
***REMOVED***
db.custom_footer = { "", "  2023: The year of Linux on Desktop! (WSL)   " ***REMOVED***
db.session_directory = "/home/mauromotion/.con***REMOVED***g/nvim/session"
db.session_auto_save_on_exit = true
