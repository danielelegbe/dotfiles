return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	opts = {
		keymap = { preset = "enter" },

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},

		signature = { enabled = true },

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "dadbod" },
			cmdline = {},
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					score_offset = 1000,
				},
				snippets = {
					name = "snippets",
					enabled = true,
					module = "blink.cmp.sources.snippets",
					score_offset = 900,
				},
				dadbod = {
					name = "Dadbod",
					module = "vim_dadbod_completion.blink",
					score_offset = 950,
				},
			},
		},
	},
}
