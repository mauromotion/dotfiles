return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			-- Keybindgs with "which-key" plugin
			local wk = require("which-key")
			wk.add({
				{ "<leader>g", group = "Neogit/Gitsigns" },
				S = { "<leader>gS", gs.stage_buffer, desc = "Stage Buffer (Gitsigns)" },
				u = { "<leader>gu", gs.undo_stage_hunk, desc = "Undo Stage Hunk (Gitsigns)" },
				R = { "<leader>gR", gs.reset_buffer, desc = "Reset Buffer (Gitsigns)" },
				p = { "<leader>gp", gs.preview_hunk_inline, desc = "Preview Hunk Inline (Gitsigns)" },
				B = {
					"<leader>gB",
					function()
						gs.blame_line({ full = true })
					end,
					desc = "Blame Line",
				},
				d = { "<leader>d", gs.diffthis, desc = "Diff This (Gitsigns)" },
				D = {
					"<leader>D",
					function()
						gs.diffthis("~")
					end,
					desc = "Diff This ~ (Gitsigns)",
				},
			})

			-- Vanilla keybindings
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk (Gitsigns)")
      map("n", "[h", gs.prev_hunk, "Prev Hunk (Gitsigns)")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk (Gitsigns)")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk (Gitsigns)")
      -- map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      -- map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      -- map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      -- map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
      -- map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      -- map("n", "<leader>ghd", gs.diffthis, "Diff This")
      -- map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk (Gitsigns)")
		end,
	},
}
