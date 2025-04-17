return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/Nextcloud/03_Resources/Notes/orgfiles/**/*",
			org_default_notes_file = "~/Nextcloud/03_Resources/Notes/orgfiles/refile.org",
			org_todo_keywords = {
				"TODO(t)",
				"DOING(p)",
				"LATER(l)",
				"WAIT(w)",
				"HOLD(h)",
				"IDEA(i)",
				"|",
				"DONE(d)",
				"KILLED(k)",
				"CANCELLED(c)",
			},
		})
	end,
}
