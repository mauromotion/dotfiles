return {
    'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      -- cmd = "Telescope",
      -- version = false,
      dependencies = {
        "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
      },
      config = function ()
        require("telescope").load_extension("fzf")
        
        -- Keymaps
        local map = vim.keymap

        map.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
        map.set("n", "<leader><space>", "<CMD>Telescope find_files<CR>")
        map.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
        map.set("n", "<leader>fs", "<CMD>Telescope grep_string<CR>")
      end,
}

-- TODO: bind 'TodoTelescope' to a key
