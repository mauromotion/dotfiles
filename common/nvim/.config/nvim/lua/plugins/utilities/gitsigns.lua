return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			-- Keybindgs with "which-key" plugin
			local wk = require("which-key")
			wk.add({
				{ "<leader>g", group = "Gitsigns / Neogit" },
				{ "<leader>gS", gs.stage_buffer, desc = "Stage Buffer (Gitsigns)" },
				{ "<leader>gu", gs.undo_stage_hunk, desc = "Undo Stage Hunk (Gitsigns)" },
				{ "<leader>gR", gs.reset_buffer, desc = "Reset Buffer (Gitsigns)" },
				{ "<leader>gg", gs.preview_hunk_inline, desc = "Preview Hunk Inline (Gitsigns)" },
				{
					"<leader>gB",
					function()
						gs.blame_line({ full = true })
					end,
					desc = "Blame Line",
				},
				{ "<leader>gd", gs.diffthis, desc = "Diff This (Gitsigns)" },
				{
					"<leader>gD",
					function()
						gs.diffthis("~")
					end,
					desc = "Diff This ~ (Gitsigns)",
				},
				{ "]h", gs.next_hunk, desc = "Next Hunk", mode = "n" },
				{ "[h", gs.prev_hunk, desc = "Prev Hunk", mode = "n" },
				{ "<leader>ghs", ":Gitsigns stage_hunk<CR>", desc = "Stage Hunk", mode = { "n", "v" } },
				{ "<leader>ghr", ":Gitsigns reset_hunk<CR>", desc = "Reset Hunk", mode = { "n", "v" } },
				{ "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Select Hunk", mode = { "o", "x" } },
			}, { buffer = buffer })
		end,
	},
}
