 ------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dot***REMOVED***les * --
-- Neovim -- base.lua ---------------------------------

local g = vim.g
local o = vim.o
local opt = vim.opt

-- Enable theming
o.termguicolors = true

-- Better editing experience
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = 'yes:2'
o.cursorline = true
o.tabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true
o.smarttab = true
o.wrap = true

-- Can copy/paste outside Neovim
o.clipboard = "unnamedplus" 

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undo***REMOVED***le = true
o.swap***REMOVED***le = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Stable buffer content on window open/close events.
o.splitkeep = 'screen'

-- Enables mouse clicking
opt.mouse = "a"

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Remember 50 items in commandline history
o.history = 50
