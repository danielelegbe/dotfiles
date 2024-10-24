return {
	lazy = false,
	"rmagatti/auto-session",
	keys = {
		{ "<leader>ls", "<cmd>SessionSearch<CR>", desc = "List Sessions" },
	},
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	},
}
