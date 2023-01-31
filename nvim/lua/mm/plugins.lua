------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dotfiles * --
-- Neovim -- Plugins.lua -----------------------------

local status, packer = pcall(require, 'packer')
if not status then
  print('Packer is not installed')
  return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
    requires = { { 'nvim-lua/plenary.nvim' } },
  })
  use('nvim-telescope/telescope-file-browser.nvim')

  -- Treesitter Syntax Highlighting
  use({
    {
      'nvim-treesitter/nvim-treesitter',
      event = 'CursorHold',
      run = ':TSUpdate',
      config = function()
        require('mm.plugins.treesitter')
      end,
    },
    { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
    { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
  })
  -- Colorschemes
  use('wittyjudge/gruvbox-material.nvim')
  use{'olimorris/onedarkpro.nvim',
    config = function() 
      require('onedarkpro').setup({
      options = {
        cursorline = true,
        highlight_inactive_windows = true
      },
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "italic",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
      }
    }) end}
  use('gruvbox-community/gruvbox')
  use('martinsione/darkplus.nvim')
  use('EdenEast/nightfox.nvim')
  use('shaunsingh/nord.nvim')
  use{'folke/tokyonight.nvim', branch = main }
  use{'catppuccin/nvim', as = 'catppuccin' }
  use('rose-pine/neovim')
  use{'sainnhe/everforest', background = 'hard'}

  -- Autocompletion and Documentation
  use{'neoclide/coc.nvim', 
    branch = 'release'}

  -- Better editing
  use('tpope/vim-surround')
  use('tpope/vim-commentary')
  use {'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end}
  use{'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup {} end}

  -- Better UI/UX
  use('ryanoasis/vim-devicons')
  -- use('scrooloose/nerdtree')
  -- use ('nvim-tree/nvim-web-devicons')
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
    end,

    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Status line
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('mm.plugins.lualine')
    end,
  })

  -- Zen modes
  use({
    'Pocco81/true-zen.nvim',
    config = function()
      require('true-zen').setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  })

  -- Live Server
  use({
    'aurum77/live-server.nvim',
    run = function()
      require'live_server.util'.install()
    end,
    cmd = { 'LiveServer', 'LiveServerStart', 'LiveServerStop' },
  })

  if packer_bootstrap then
packer.sync()
  end
end)
