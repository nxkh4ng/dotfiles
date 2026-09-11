return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	opts = {
		preset = "powerline",
		transparent_bg = false,
		transparent_cursor = true,
		options = {
			multilines = {
				enabled = true,
				always_show = true,
			},
		},
	},
}
