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

  -- Packer itself
  use'wbthomason/packer.nvim'

  -- Dashboard 
  use'glepnir/dashboard-nvim'

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  -- Telescope File Browser
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
    -- Treesitter plugins
    { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
    { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
  })

  --------------------
  -- *Colorschemes* --
  -- -----------------
  use'EdenEast/nightfox.nvim'
  use'shaunsingh/nord.nvim'

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
  use'williamboman/mason.nvim' -- simple to use language server installer 
  use'williamboman/mason-lspconfig' -- simple to use language server installer 
  use'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

  ----------------------
  -- *Better editing* --
  ----------------------

  -- Quickly surround anything with anything
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- Quickly comment/uncomment with "gcc"
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Autoclose parentheses
  use {'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end}

  -- Shows colours over colours hashes
  use{'norcalli/nvim-colorizer.lua', -- Shows colors over color-codes
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

  -- LSP context bar
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
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
