return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-project.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = require("telescope.themes").get_dropdown({
					layout_strategy = "horizontal",
					layout_config = {
						height = 0.5,
						prompt_position = "top",
						width = 0.85,
						preview_cutoff = 0.8,
						preview_width = 0.5,
					},
					path_display = { "truncate" },
					file_ignore_patterns = {
						"node_modules",
						"dist",
						"yarn%.lock",
						"package%-lock.json",
						"pnpm%-lock.yaml",
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = {
							["q"] = actions.close,
							["v"] = actions.select_vertical,
						},
					},
				}),
				pickers = {
					buffers = {
						mappings = {
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
						sort_mru = true,
						sort_lastused = true,
						initial_mode = "normal",
						ignore_current_buffer = true,
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})

			vim.keymap.set("n", "<leader>sf", function()
				builtin.live_grep({
					prompt_title = "Live Grep in All Files",
				})
			end, { desc = "[S]earch in All [F]iles" })

			vim.keymap.set("n", "<leader>.", function()
				builtin.oldfiles({ prompt_title = "Recent Files" })
			end, { desc = "Search Recent Files" })

			vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search [/] in current file" })

			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })

			vim.keymap.set("n", "<leader>sd", function()
				builtin.find_files({ cwd = "~/.config", prompt_title = "Search Dot Files" })
			end, { desc = "[S]earch [D]ot Files" })

			vim.keymap.set("n", "<leader>sr", function()
				builtin.resume()
			end, { desc = "[S]earch [R]esume" })
		end,
	},
}
