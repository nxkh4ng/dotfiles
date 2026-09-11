return {
	"rachartier/tiny-code-action.nvim",
	dependencies = { "folke/snacks.nvim" },
	event = "LspAttach",
	config = function()
		local tiny_code_action = require("tiny-code-action")
		tiny_code_action.setup({
			backend = "vim",
			picker = {
				"snacks",
				opts = {
					layout = {
						preset = function()
							return vim.o.columns >= 120 and "default" or "dropdown"
						end,
					},
				},
			},
		})

		vim.keymap.set({ "n", "x" }, "g.", function()
			require("tiny-code-action").code_action()
		end, { noremap = true, silent = true })
	end,
}
