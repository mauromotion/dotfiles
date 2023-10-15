return {
  "rcarriga/nvim-notify",
  config = function(_, opts)
    require("notify").setup(vim.tbl_extend("keep", {
      background_colour = "#000000",
    }, opts))
  end,
}
