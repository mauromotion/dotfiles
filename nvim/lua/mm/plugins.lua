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

-- Packer can manage itself
packer.startup(function(use)
  use('wbthomason/packer.nvim')

  -- Packer floating window
  packer.init {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" ***REMOVED***
      end,
    ***REMOVED***,
  ***REMOVED***

  --* PLUGINS *--

  -- Packer itself
  use'wbthomason/packer.nvim'

  -- Dashboard 
  use'glepnir/dashboard-nvim'

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
  use'wittyjudge/gruvbox-material.nvim'
  use'shatur/neovim-ayu'
  use'gruvbox-community/gruvbox'
  use'martinsione/darkplus.nvim'
  use'EdenEast/nightfox.nvim'
  use'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
  use{'catppuccin/nvim', as = 'catppuccin' ***REMOVED***
  use'rose-pine/neovim'
  use{'sainnhe/everforest', background = 'hard'***REMOVED***

  -- Autocompletion and Documentation
  --  use{'neoclide/coc.nvim', 
  --    branch = 'release'***REMOVED***

  use'hrsh7th/nvim-cmp' -- The completion plugin
  use'hrsh7th/cmp-buffer' -- Buffer completion
  use'hrsh7th/cmp-path' -- Path completion
  use'hrsh7th/cmp-cmdline'  -- cmdline completion
  use'saadparwaiz1/cmp_luasnip' -- Snippet completions
  use'hrsh7th/cmp-nvim-lsp'
  use'hrsh7th/cmp-nvim-lua'

  -- Snippets
  use'L3MON4D3/LuaSnip' -- Snippet engine
  use'rafamadriz/friendly-snippets' -- A repo of snippets

  -- LSP
  use'neovim/nvim-lspcon***REMOVED***g' -- Enable LSP
  -- use('williamboman/nvim-lsp-installer')
  use'williamboman/mason.nvim' -- simple to use language server installer 
  use'williamboman/mason-lspcon***REMOVED***g' -- simple to use language server installer 
  -- use "tamago324/nlsp-settings.nvim" -- language server settings de***REMOVED***ned in json
  use'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions


  -- Better editing
  use'tpope/vim-surround'
  use'tpope/vim-commentary'
  use {'windwp/nvim-autopairs',
    con***REMOVED***g = function() require('nvim-autopairs').setup {***REMOVED*** end***REMOVED***
  use{'norcalli/nvim-colorizer.lua',
    con***REMOVED***g = function() require('colorizer').setup {***REMOVED*** end***REMOVED***

  -- Better UI/UX
  use'ryanoasis/vim-devicons'
  use({
    'akinsho/bufferline.nvim',
    con***REMOVED***g = function()
      require('mm.plugins.bufferline')
    end,
  ***REMOVED***)
  use'nvim-tree/nvim-web-devicons'
  use {
    'nvim-tree/nvim-tree.lua',
    con***REMOVED***g = function()
      require('mm.plugins.nvimtree')
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

  -- Automatically set up your con***REMOVED***guration after cloning packer.nvim  
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
