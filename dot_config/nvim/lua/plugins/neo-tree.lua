return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					always_show_by_pattern = {
						".env*",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>n", ":Neotree toggle float reveal<CR>", { desc = "Show file in NeoTree" })
		vim.keymap.set("n", "<C-n>", ":Neotree toggle float reveal<CR>")
	end,
}
