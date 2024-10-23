return {
	lazy = false,
	"rmagatti/auto-session",
	keys = {
		{ "<leader>ls", "<cmd>SessionSearch<CR>", desc = "[L]ist [S]essions" },
	},
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	},
}
