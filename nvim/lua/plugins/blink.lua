return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	event = "InsertEnter",
	opts = {
		keymap = {
			preset = "none",
			["<A-m>"] = { "show", "show_documentation", "hide_documentation" },
			["<A-y>"] = { "accept" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<A-n>"] = { "select_next", "fallback_to_mappings" },
			["<A-p>"] = { "select_prev", "fallback_to_mappings" },

			["<A-N>"] = { "scroll_documentation_down", "fallback" },
			["<A-P>"] = { "scroll_documentation_up", "fallback" },
		},
		appearance = { nerd_font_variant = "normal" },
		completion = {
			menu = { border = "solid" },
			documentation = {
				window = { border = "solid" },
				auto_show = false,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
