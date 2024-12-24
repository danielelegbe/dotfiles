return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{

		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "v0.*",
		opts = {
			enabled = function()
				return not vim.tbl_contains({ "NvimTree", "minifiles", "DressingInput" }, vim.bo.filetype)
					and vim.bo.buftype ~= "prompt"
					and vim.b.completion ~= false
			end,
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
				default = { "lazydev", "lsp", "path", "snippets", "buffer", "dadbod" },
				cmdline = {},
				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						score_offset = 100,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					dadbod = {
						name = "Dadbod",
						module = "vim_dadbod_completion.blink",
						score_offset = 95,
					},
					snippets = {
						name = "snippets",
						enabled = true,
						module = "blink.cmp.sources.snippets",
						score_offset = 90,
					},
				},
			},
		},
	},
}
