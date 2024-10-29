return {
	lazy = false,
	"rmagatti/auto-session",
	keys = {
		{ "<leader>ls", "<cmd>SessionSearch<CR>", desc = "List Sessions" },
	},
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		auto_restore = false,
	},
}
