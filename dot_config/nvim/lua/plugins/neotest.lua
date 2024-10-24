return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest"),
				require("neotest-vitest")({
					filter_dir = function(name)
						return name ~= "node_modules"
					end,
					vitest_cmd = function()
						return "pnpm test"
					end,
				}),
			},
		})
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tn",
			"<cmd>lua require('neotest').run.run()<CR>",
			{ noremap = true, silent = true, desc = "Run Tests" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ts",
			"<cmd>lua require('neotest').summary.toggle()<CR>",
			{ noremap = true, silent = true, desc = "Open Test Summary" }
		)
	end,
}
