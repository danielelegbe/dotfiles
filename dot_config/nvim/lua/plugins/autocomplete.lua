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
			nerd_font_variant = "normal",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
				},
			},
			menu = {
				border = "rounded",
			},
		},
		signature = { enabled = true },
		sources = {
			completion = {
				enabled_providers = function()
					local node = vim.treesitter.get_node()
					if vim.bo.filetype == "lua" then
						return { "lsp", "path" }
					elseif node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
						return { "buffer" }
					else
						return { "lsp", "path", "snippets", "buffer" }
					end
				end,
			},
		},
	},
}
