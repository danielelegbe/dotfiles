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
			close_if_last_window = true,
			neo_tree_popup_input_ready = false,
			event_handlers = {
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.opt_local.relativenumber = true
				end,
			},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					always_show_by_pattern = {
						".env*",
					},
				},
			},
		})

		vim.keymap.set("n", "<C-e>", "<cmd>Neotree toggle reveal<CR>")
	end,
}
