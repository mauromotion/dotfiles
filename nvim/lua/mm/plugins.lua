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
    tag = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' ***REMOVED*** ***REMOVED***,
  ***REMOVED***)
  use('nvim-telescope/telescope-***REMOVED***le-browser.nvim')

  -- Treesitter Syntax Highlighting
  use({
    {
      'nvim-treesitter/nvim-treesitter',
      event = 'CursorHold',
      run = ':TSUpdate',
      con***REMOVED***g = function()
        require('mm.plugins.treesitter')
      end,
    ***REMOVED***,
    { 'nvim-treesitter/playground', after = 'nvim-treesitter' ***REMOVED***,
    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' ***REMOVED***,
    { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' ***REMOVED***,
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' ***REMOVED***,
    { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' ***REMOVED***,
  ***REMOVED***)
  -- Colorschemes
  use({
      'olimorris/onedarkpro.nvim',
      con***REMOVED***g = function()
        require('mm.plugins.onedarkpro')
      end,
  ***REMOVED***)
  use('wittyjudge/gruvbox-material.nvim')
  use('shatur/neovim-ayu')
  use('gruvbox-community/gruvbox')
  use('martinsione/darkplus.nvim')
  use('EdenEast/nightfox.nvim')
  use('shaunsingh/nord.nvim')
  use{'folke/tokyonight.nvim', branch = main ***REMOVED***
  use{'catppuccin/nvim', as = 'catppuccin' ***REMOVED***
  use('rose-pine/neovim')
  use{'sainnhe/everforest', background = 'hard'***REMOVED***

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
  -- use('scrooloose/nerdtree')
  -- use ('nvim-tree/nvim-web-devicons')
  use {
    'nvim-tree/nvim-tree.lua',
    con***REMOVED***g = function()
      require('nvim-tree').setup()
    end,

    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for ***REMOVED***le icons
    ***REMOVED***,
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  ***REMOVED***
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
