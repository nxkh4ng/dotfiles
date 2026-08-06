return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		default_file_explorer = true,
		columns = {
			{ "size", align = "right" },
			"icon",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		watch_for_changes = true,
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 1000,
			autosave_changes = true,
		},
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{ "<leader>o", "<cmd>Oil<cr>", desc = "Open file explorer" },
	},
}
