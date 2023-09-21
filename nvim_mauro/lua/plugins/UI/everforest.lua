return {
  "neanias/everforest-nvim",
  lazy = false,
  config = function()
    require("everforest").setup({
      background = "hard",
      transparent_background_level = 0,
      italics = true,
      disable_italics_comments = false,
      ui_contrast = "low",
    })
  end,
}
