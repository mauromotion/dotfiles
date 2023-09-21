return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    },
  },

  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 0,
        italics = true,
        disable_italics_comments = false,
        ui_contrast = "low",
      })
    end,
  },

  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_transparent_background = 0
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
