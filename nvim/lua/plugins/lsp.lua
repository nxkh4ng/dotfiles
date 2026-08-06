return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()

		local servers = {
			lua_ls = {
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = false
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = { "lua/?.lua", "lua/?/init.lua" },
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								"${3rd}/luv/library",
							},
						},
					})
				end,
				settings = { Lua = {
					format = { enable = false },
				} },
			},

			gopls = {
				settings = {
					gopls = {
						analyses = {
							shadow = false,
							undeclaredname = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
						directoryFilters = {
							"-**/node_modules",
							"-.git",
							"-**/.cache",
							"-**/vendor",
						},
						usePlaceholders = true,
						staticcheck = true,
						symbolScope = "workspace",
						vulncheck = "Imports",
						codelenses = {
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = false,
						},
					},
				},
			},

			svelte = {},
			emmet_language_server = {},
			basedpyright = {},
			html = {},
			cssls = {},
			ts_ls = {},
			tailwindcss = {},
		}

		for name, server in pairs(servers) do
			server.capabilities = capabilities
			vim.lsp.config(name, server)
			vim.lsp.enable(name)
		end

		-- Diagnostic config
		vim.diagnostic.config({
			update_in_insert = false,
			severity_sort = true,
			float = { source = "if_many" },
			underline = { severity = { min = vim.diagnostic.severity.WARN } },
			virtual_text = {
				prefix = "■",
				source = "if_many",
			},
			jump = {
				keys = true,
				on_jump = function(_, bufnr)
					vim.diagnostic.open_float({
						bufnr = bufnr,
						scope = "cursor",
						focus = false,
					})
				end,
			},
		})
		-- vim.keymap.set("n", "<leader>sd", vim.diagnostic.setloclist)

		-- Builtin LPS Keymaps
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
		vim.keymap.set("n", "df", vim.diagnostic.open_float)
		vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
	end,
}
