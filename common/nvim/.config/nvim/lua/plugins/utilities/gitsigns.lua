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
			wk.register({
				name = "Neogit/Gitsigns",
				S = { gs.stage_buffer, "Stage Buffer (Gitsigns)" },
				u = { gs.undo_stage_hunk, "Undo Stage Hunk (Gitsigns)" },
				R = { gs.reset_buffer, "Reset Buffer (Gitsigns)" },
				p = { gs.preview_hunk_inline, "Preview Hunk Inline (Gitsigns)" },
				B = {
					function()
						gs.blame_line({ full = true })
					end,
					"Blame Line",
				},
				d = { gs.diffthis, "Diff This (Gitsigns)" },
				D = {
					function()
						gs.diffthis("~")
					end,
					"Diff This ~ (Gitsigns)",
				},
			}, { prefix = "<leader>g" })

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
