return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = require("telescope.themes").get_dropdown({
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
					},
				}),
				pickers = {
					buffers = {
						mappings = {
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
					},
				},
			})

			require("telescope").load_extension("ui-select")

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

			vim.keymap.set("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find({
					prompt_title = "Search in Current Buffer",
				})
			end, { desc = "Search [/] in current file" })

			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
