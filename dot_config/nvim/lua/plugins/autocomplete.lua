local trigger_text = ";"

return {
	{
		"saghen/blink.compat",
		-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
		version = "*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
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
		dependencies = {
			"rafamadriz/friendly-snippets",
			"supermaven-nvim",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip").filetype_extend("javascriptreact", { "html" })
					require("luasnip").filetype_extend("typescriptreact", { "html" })
					require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/snippets/" } })
				end,
			},
		},

		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			enabled = function()
				return not vim.tbl_contains({ "NvimTree", "minifiles", "DressingInput" }, vim.bo.filetype)
					and vim.bo.buftype ~= "prompt"
					and vim.b.completion ~= false
			end,
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
			},
			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				list = {
					max_items = 30,
				},
			},

			signature = { enabled = true },
			sources = {
				default = { "lazydev", "lsp", "path", "buffer", "dadbod", "supermaven", "snippets" },
				cmdline = {},
				providers = {
					lsp = {
						name = "lsp",
						module = "blink.cmp.sources.lsp",
						score_offset = 100,
					},
					snippets = {
						name = "snippets",
						enabled = true,
						max_items = 15,
						min_keyword_length = 2,
						module = "blink.cmp.sources.snippets",
						score_offset = 85, -- the higher the number, the higher the priority
						-- Only show snippets if I type the trigger_text characters, so
						-- to expand the "bash" snippet, if the trigger_text is ";" I have to
						should_show_items = function()
							local col = vim.api.nvim_win_get_cursor(0)[2]
							local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
							-- NOTE: remember that `trigger_text` is modified at the top of the file
							return before_cursor:match(trigger_text .. "%w*$") ~= nil
						end,
						-- After accepting the completion, delete the trigger_text characters
						-- from the final inserted text
						transform_items = function(_, items)
							local col = vim.api.nvim_win_get_cursor(0)[2]
							local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
							local trigger_pos = before_cursor:find(trigger_text .. "[^" .. trigger_text .. "]*$")
							if trigger_pos then
								for _, item in ipairs(items) do
									item.textEdit = {
										newText = item.insertText or item.label,
										range = {
											start = { line = vim.fn.line(".") - 1, character = trigger_pos - 1 },
											["end"] = { line = vim.fn.line(".") - 1, character = col },
										},
									}
								end
							end
							-- NOTE: After the transformation, I have to reload the luasnip source
							-- Otherwise really crazy shit happens and I spent way too much time
							-- figuring this out
							vim.schedule(function()
								require("blink.cmp").reload("snippets")
							end)
							return items
						end,
					},
					-- snippets = {
					-- 	name = "snippets",
					-- 	enabled = true,
					-- 	max_items = 8,
					-- 	min_keyword_length = 2,
					-- 	module = "blink.cmp.sources.snippets",
					-- 	score_offset = 85, -- the higher the number, the higher the priority
					-- 	transform_items = function(_, items)
					-- 		vim.schedule(function()
					-- 			require("blink.cmp").reload("snippets")
					-- 		end)
					-- 		return items
					-- 	end,
					-- },
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					path = {
						name = "Path",
						module = "blink.cmp.sources.path",
						score_offset = 3,
						-- When typing a path, I would get snippets and text in the
						-- suggestions, I want those to show only if there are no path
						-- suggestions
						opts = {
							trailing_slash = false,
							label_trailing_slash = true,
							get_cwd = function(context)
								return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
							end,
							show_hidden_files_by_default = true,
						},
					},
					buffer = {
						name = "Buffer",
						enabled = true,
						max_items = 3,
						module = "blink.cmp.sources.buffer",
						min_keyword_length = 4,
					},
					dadbod = {
						name = "Dadbod",
						module = "vim_dadbod_completion.blink",
						score_offset = 85, -- the higher the number, the higher the priority
					},
					supermaven = {
						name = "supermaven",
						module = "blink.compat.source",
						score_offset = 80,
					},
				},
			},
			snippets = {
				preset = "luasnip",
				-- This comes from the luasnip extra, if you don't add it, won't be able to
				-- jump forward or backward in luasnip snippets
				-- https://www.lazyvim.org/extras/coding/luasnip#blinkcmp-optional
				-- expand = function(snippet)
				-- 	require("luasnip").lsp_expand(snippet)
				-- end,
				-- active = function(filter)
				-- 	if filter and filter.direction then
				-- 		return require("luasnip").jumpable(filter.direction)
				-- 	end
				-- 	return require("luasnip").in_snippet()
				-- end,
				-- jump = function(direction)
				-- 	require("luasnip").jump(direction)
				-- end,
			},
		},
	},
}
