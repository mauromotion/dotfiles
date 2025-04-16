return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/Notes/orgfiles/**/*",
			org_default_notes_file = "~/Notes/orgfiles/refile.org",
			org_todo_keywords = {
				"TODO(t)",
				"DOING(p)",
				"LATER(l)",
				"WAIT(w)",
				"IDEA(i)",
				"|",
				"DONE(d)",
				"CANCELLED(c)",
			},
		})
	end,
}
