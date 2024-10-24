return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>qq",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>qQ",
			"<cmd>Trouble diagnostics toggle <cr>",
			desc = "View All Diagnostics (Trouble)",
		},
		{
			"<leader>ct",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
	},
}
