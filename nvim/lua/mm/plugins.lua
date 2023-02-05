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

-- Packer can manage itself
packer.startup(function(use)
  use('wbthomason/packer.nvim')

  -- Packer floating window
  packer.init {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  --* PLUGINS *--

  -- Packer itself
  use'wbthomason/packer.nvim'

  -- Dashboard 
  use'glepnir/dashboard-nvim'

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
  use({
    'olimorris/onedarkpro.nvim',
    config = function()
      require('mm.plugins.onedarkpro')
    end
  })
  use'wittyjudge/gruvbox-material.nvim'
  use'shatur/neovim-ayu'
  use'gruvbox-community/gruvbox'
  use'martinsione/darkplus.nvim'
  use'EdenEast/nightfox.nvim'
  use'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
  use{'catppuccin/nvim', as = 'catppuccin' }
  use'rose-pine/neovim'
  use{'sainnhe/everforest', background = 'hard'}

  -- Autocompletion and Documentation
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
  use'neovim/nvim-lspconfig' -- Enable LSP
  -- use('williamboman/nvim-lsp-installer')
  use'williamboman/mason.nvim' -- simple to use language server installer 
  use'williamboman/mason-lspconfig' -- simple to use language server installer 
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json
  use'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

  -- Git
  use{
    'lewis6991/gitsigns.nvim',
    config = function()
      require('mm.plugins.gitsigns')
    end
  }

  -- Better editing
  use'tpope/vim-surround'
  use'tpope/vim-commentary'
  use {'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end}
  use{'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup {} end}

  -- Better UI/UX
  use'ryanoasis/vim-devicons'
  use({
    'akinsho/bufferline.nvim',
    config = function()
      require('mm.plugins.bufferline')
    end,
  })
  use'nvim-tree/nvim-web-devicons'
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('mm.plugins.nvimtree')
    end,

    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup()
    end,
  })

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

  -- Automatically set up your configuration after cloning packer.nvim  
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
