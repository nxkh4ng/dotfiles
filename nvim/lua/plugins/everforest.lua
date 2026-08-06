return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		require("everforest").setup({
			background = "hard",
			ui_contrast = "high",
			float_style = "bright",
			transparent_background_level = 0,
			italics = false,
			disable_italic_comments = true,
			dim_inactive_windows = true,

			on_highlights = function(hl, palette)
				hl.CursorLineNr = { fg = palette.green, bold = true }
				hl.BlinkCmpMenuSelection = { bg = palette.bg_green }
				hl.SnacksPickerGitStatusUntracked = { fg = palette.grey0 }
				hl.SnacksPickerGitStatusIgnored = { fg = palette.grey2 }
				hl.SnacksPickerTree = { fg = palette.grey0 }
			end,

			-- Override colors
			colours_override = function(palette)
				palette.bg_dim = "#161a1d"
				palette.bg0 = "#1d2225"
				palette.bg1 = "#262e31"
				palette.bg2 = "#2d3539"
				palette.bg3 = "#2e3538"
				palette.bg4 = "#2f3437"
				palette.bg5 = "#2f3735"

				palette.fg = "#c6ba9f"
				palette.red = "#e77e80"
				palette.green = "#a8c181"
				palette.orange = "#e69975"
				palette.yellow = "#dbbd80"
				palette.blue = "#80bcb4"
				palette.purple = "#d699b7"
				palette.aqua = "#82c091"
				palette.grey0 = "#a6b0a0"
				palette.grey1 = "#939f91"
				palette.grey2 = "#819286"

				palette.statusline1 = "#a8c181"
				palette.statusline2 = "#c6ba9f"
				palette.statusline3 = "#e77e80"
			end,
		})
		vim.cmd([[colorscheme everforest]])
	end,
}
