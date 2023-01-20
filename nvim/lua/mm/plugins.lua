------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dot***REMOVED***les * --
-- Neovim -- Plugins.lua -----------------------------

local status, packer = pcall(require, 'packer')
if not status then
	print('Packer is not installed')
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
augroup packer_user_con***REMOVED***g
autocmd!
autocmd BufWritePost plugins.lua source <a***REMOVED***le> | PackerSync
augroup END
]])

packer.startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

	-- Dashboard is a nice start screen for nvim
	use('glepnir/dashboard-nvim')

	-- Telescope
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' ***REMOVED*** ***REMOVED***,
	***REMOVED***)
	use('nvim-telescope/telescope-***REMOVED***le-browser.nvim')
	
	-- Treesitter Syntax Highlighting
	use({
		'nvim-treesitter/nvim-treesitter',
		con***REMOVED***g = function()
			require('mm.plugins.treesitter')
		end,
	***REMOVED***) 

	-- Colorschemes
	use('wittyjudge/gruvbox-material.nvim')
	use('olimorris/onedarkpro.nvim')
	use('gruvbox-community/gruvbox')
	use('martinsione/darkplus.nvim')
	use('EdenEast/nightfox.nvim')
	use('shaunsingh/nord.nvim')
	use{'folke/tokyonight.nvim', branch = main ***REMOVED***
	use{'catppuccin/nvim', as = 'catppuccin' ***REMOVED***
	use('rose-pine/neovim')
	use{'sainnhe/everforest', background = 'hard'***REMOVED***
	-- use{'neanias/everforest-nvim', branch = main ***REMOVED***
	
	-- Autocompletion and Documentation
	use{'neoclide/coc.nvim', 
		branch = 'release'***REMOVED***

	-- Better editing
	use('tpope/vim-surround')
	use('tpope/vim-commentary')
	use {'windwp/nvim-autopairs',
		con***REMOVED***g = function() require('nvim-autopairs').setup {***REMOVED*** end***REMOVED***
	use{'norcalli/nvim-colorizer.lua',
		con***REMOVED***g = function() require('colorizer').setup {***REMOVED*** end***REMOVED***

	-- Better UI/UX
	use('ryanoasis/vim-devicons')
	use('scrooloose/nerdtree')

	-- Status line
	use({
		'nvim-lualine/lualine.nvim',
		con***REMOVED***g = function()
			require('mm.plugins.lualine')
		end,
	***REMOVED***)

	-- Zen modes
	use({
		'Pocco81/true-zen.nvim',
		con***REMOVED***g = function()
			require('true-zen').setup {
				-- your con***REMOVED***g goes here
				-- or just leave it empty :)
			***REMOVED***
		end,
	***REMOVED***)

	-- Live Server
	use({
		'aurum77/live-server.nvim',
		run = function()
			require'live_server.util'.install()
		end,
		cmd = { 'LiveServer', 'LiveServerStart', 'LiveServerStop' ***REMOVED***,
	***REMOVED***)

	if packer_bootstrap then
		packer.sync()
	end
end)
