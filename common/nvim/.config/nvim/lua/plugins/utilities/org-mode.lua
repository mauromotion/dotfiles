return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/Notes/orgfiles/**/*",
			org_default_notes_file = "~/Notes/orgfiles/refile.org",
		})
	end,
}
