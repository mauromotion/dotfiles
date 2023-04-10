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

-- Reloads Neovim whenever you save plugins.lua
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

  ---------------
  --* PLUGINS *--
  ---------------

  use'wbthomason/packer.nvim' -- Packer itself
  use'glepnir/dashboard-nvim' -- Dashboard 
  use({
    'nvim-telescope/telescope.nvim', -- Telescope
    tag = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })
  use('nvim-telescope/telescope-file-browser.nvim')
  use({
    {
      'nvim-treesitter/nvim-treesitter', -- Treesitter Syntax Highlighting
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

  --------------------
  -- *Colorschemes* --
  -- -----------------
  -- use({
  --   'olimorris/onedarkpro.nvim',
  --   config = function()
  --     require('mm.plugins.onedarkpro')
  --   end
  -- })
  -- use'wittyjudge/gruvbox-material.nvim'
  -- use'shatur/neovim-ayu'
  -- use'gruvbox-community/gruvbox'
  -- use'martinsione/darkplus.nvim'
  use'EdenEast/nightfox.nvim'
  use'shaunsingh/nord.nvim'
  -- use 'folke/tokyonight.nvim'
  -- use{'catppuccin/nvim', as = 'catppuccin' }
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --       require("rose-pine").setup()
  --   end
  -- })
  -- use{'sainnhe/everforest', background = 'hard'}
  -- use 'mhartington/oceanic-next'

  ----------------------------------------
  -- *Autocompletion and Documentation* --
  ----------------------------------------
  use'hrsh7th/nvim-cmp' -- The completion plugin
  use'hrsh7th/cmp-buffer' -- Buffer completion
  use'hrsh7th/cmp-path' -- Path completion
  use'hrsh7th/cmp-cmdline'  -- cmdline completion
  use'saadparwaiz1/cmp_luasnip' -- Snippet completions
  use'hrsh7th/cmp-nvim-lsp'
  use'hrsh7th/cmp-nvim-lua'
  use'L3MON4D3/LuaSnip' -- Snippet engine
  use'rafamadriz/friendly-snippets' -- A repo of snippets

  --------------------------------
  -- *Language Server Protocol* --
  --------------------------------
  use'neovim/nvim-lspconfig' -- Enable LSP
  -- use('williamboman/nvim-lsp-installer')
  use'williamboman/mason.nvim' -- simple to use language server installer 
  use'williamboman/mason-lspconfig' -- simple to use language server installer 
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json
  use'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

  ----------------------
  -- *Better editing* --
  ----------------------

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- Comment lines quickly
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- use'tpope/vim-commentary' -- Comment lines quickly
  use {'windwp/nvim-autopairs', -- Autoclose parentheses
    config = function() require('nvim-autopairs').setup {} end}

  -- Add color behind hash codes
  use{'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup {} end}

  --------------------
  -- *Better UI/UX* --
  -------------------- 
  -- Icons
  use'nvim-tree/nvim-web-devicons'
  use'ryanoasis/vim-devicons'

  -- Buffers like tabs
  use({
    'akinsho/bufferline.nvim',
    config = function()
      require('mm.plugins.bufferline')
    end
  })

  -- File browser
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('mm.plugins.nvimtree')
    end,
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Git status
  use{
    'lewis6991/gitsigns.nvim',
    config = function()
      require('mm.plugins.gitsigns')
    end
  }

  -- Terminal
  -- use {"akinsho/toggleterm.nvim", tag = 'v0.8.3',
  --   config = function()
  -- require("toggleterm").setup()
  --   end}

  -- LSP context bar
  -- use({
  --   "utilyre/barbecue.nvim",
  --   tag = "*",
  --   requires = {
  --     "SmiteshP/nvim-navic",
  --   },
  --   config = function()
  --     require("barbecue").setup()
  --   end,
  -- })

  -- Aerial
  use({
    'stevearc/aerial.nvim',
    config = function()
      require('mm.plugins.aerial')
    end
  })

  -- Status line
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('mm.plugins.lualine')
    end
  })

  -- Zen modes
  use({
    'Pocco81/true-zen.nvim',
    config = function()
      require('true-zen').setup {
      }
    end
  })

  -------------------------------------------------------------------------
  -- *Automatically set up your configuration after cloning packer.nvim* --
  ------------------------------------------------------------------------- 
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
