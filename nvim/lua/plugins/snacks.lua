---@diagnostic disable: undefined-global
return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		quickfile = { enabled = true },
		bufdelete = { enabled = true },
		indent = {
			enabled = true,
			animate = { enabled = false },
		},
		input = {
			enabled = true,
			win = { backdrop = true },
		},
		picker = {
			enabled = true,
			exclude = { ".git", "node_modules", "bin", "build", "dist", "vendor" },
			win = {
				input = {
					keys = {
						["<A-n>"] = { "list_down", mode = { "i", "n" } },
						["<A-p>"] = { "list_up", mode = { "i", "n" } },
						["<A-N>"] = { "preview_scroll_down", mode = { "i", "n" } },
						["<A-P>"] = { "preview_scroll_up", mode = { "i", "n" } },
					},
				},
			},
		},
	},
	keys = {
		-- Finds
		{
			"<leader><leader>",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "Find files",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({
					cwd = vim.fn.stdpath("config"),
					hidden = true,
				})
			end,
			desc = "Find Config File",
		},
		{
			"<leader>e",
			function()
				Snacks.picker.explorer({ hidden = true })
			end,
			desc = "File explorer",
		},

		-- Buffers
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete all buffers except the current one",
		},

		-- Search
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = "v",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps({ layout = "vscode" })
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},

		-- LSP
		{
			"grr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "Goto References",
		},
		{
			"gri",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"grt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto Type Definition",
		},
		{
			"g0",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},

		-- Git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches({ layout = "select" })
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Lazygit",
		},
	},
}
