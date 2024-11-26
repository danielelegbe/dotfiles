return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "v0.*", -- REQUIRED release tag needed to download pre-built binaries
	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	---@module 'blink.cmp'

	opts = {
		highlight = {
			-- supporting themes: tokyonight
			-- not supported: nightfox
			use_nvim_cmp_as_default = true,
		},
		sources = {
			completion = {
				enabled_providers = { "lsp", "path", "snippets", "buffer" },
			},
			providers = {
				snippets = {
					min_keyword_length = 1, -- don't show when triggered manually, useful for JSON keys
					score_offset = -1,
				},
				path = {
					opts = { get_cwd = vim.uv.cwd },
				},
				buffer = {
					fallback_for = {}, -- disable being fallback for LSP
					max_items = 4,
					min_keyword_length = 4,
					score_offset = -3,
				},
			},
		},
		keymap = {
			["<C-space>"] = { "show" },
			["<CR>"] = { "select_and_accept", "fallback" },
			["<C-j>"] = { "select_next" },
			["<C-k>"] = { "select_prev" },
			["<C-d>"] = { "scroll_documentation_down" },
			["<C-u>"] = { "scroll_documentation_up" },
			["<Tab>"] = { "fallback" },
		},
		windows = {
			documentation = {
				border = vim.g.borderStyle,
				min_width = 15,
				max_width = 45, -- smaller, due to https://github.com/Saghen/blink.cmp/issues/194
				max_height = 10,
				auto_show = true,
				auto_show_delay_ms = 250,
			},
			autocomplete = {
				border = vim.g.borderStyle,
				min_width = 10, -- max_width controlled by draw-function
				max_height = 10,
				cycle = { from_top = false }, -- cycle at bottom, but not at the top
				draw = function(ctx)
					-- https://github.com/Saghen/blink.cmp/blob/9846c2d2bfdeaa3088c9c0143030524402fffdf9/lua/blink/cmp/types.lua#L1-L6
					-- https://github.com/Saghen/blink.cmp/blob/9846c2d2bfdeaa3088c9c0143030524402fffdf9/lua/blink/cmp/windows/autocomplete.lua#L298-L349
					-- differentiate LSP snippets from user snippets and emmet snippets
					local source, client = ctx.item.source_id, ctx.item.client_id
					if client and vim.lsp.get_client_by_id(client).name == "emmet_language_server" then
						source = "emmet"
					end

					local sourceIcons = { snippets = "󰩫", buffer = "󰦨", emmet = "" }
					local icon = sourceIcons[source] or ctx.kind_icon

					return {
						{
							" " .. ctx.item.label .. " ",
							fill = true,
							hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
							max_width = 40,
						},
						{ icon .. " ", hl_group = "BlinkCmpKind" .. ctx.kind },
					}
				end,
			},
		},
		kind_icons = {
			Text = "",
			Method = "󰊕",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰜁",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "󰒕",
			Color = "󰏘",
			Reference = "",
			File = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		},
	},
}
