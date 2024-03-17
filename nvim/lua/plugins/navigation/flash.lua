return {
	"folke/flash.nvim",
	event = "VeryLazy",
	-- @type Flash.Config
	opts = {},
  -- stylua: ignore
  keys = {
    { "<Enter>", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
    { "<S-Enter>", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
