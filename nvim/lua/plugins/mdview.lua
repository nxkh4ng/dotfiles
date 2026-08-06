return {
	"nxkh4ng/mdview.nvim",
	cmd = { "MdviewStart", "MdviewStop" },
	build = function()
		require("mdview.utils").install()
	end,
	opts = {},
}
