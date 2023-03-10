 ------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- Neovim -- base.lua ---------------------------------

local g = vim.g
local o = vim.o
local opt = vim.opt

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Enable theming
o.termguicolors = true

 -- Better editing experience
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = 'yes:2'
o.cursorline = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.smarttab = true
o.wrap = true

-- Can copy/paste outside Neovim
o.clipboard = "unnamedplus"

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
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
o.updatetime = 50

-- Remember 50 items in commandline history
o.history = 50

-- Search highlighting
opt.hlsearch = false
opt.incsearch = true

