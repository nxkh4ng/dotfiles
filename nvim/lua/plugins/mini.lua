return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		local mini_surround = require("mini.surround")
		local mini_splitjoin = require("mini.splitjoin")
		local mini_hipatterns = require("mini.hipatterns")
		local mini_pairs = require("mini.pairs")

		mini_surround.setup({
			mappings = {
				add = "sa", -- in NORMAL and VISUAL mode
				delete = "sd",
				replace = "sr",
			},
		})

		mini_splitjoin.setup({
			mappings = {
				toggle = "",
				split = "S",
			},
		})

		mini_hipatterns.setup({
			highlighters = { hex_color = require("mini.hipatterns").gen_highlighter.hex_color() },
		})

		mini_pairs.setup()
	end,
}
