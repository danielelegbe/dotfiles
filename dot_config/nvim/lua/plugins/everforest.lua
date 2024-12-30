return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.everforest_background = "hard"
		vim.g.everforest_enable_italic = true
		vim.g.everforest_ui_contrast = "high"
		vim.g.everforest_float_style = "dim"
		vim.g.everforest_diagnostic_virtual_text = "colored"
		vim.g.everforest_better_performance = 1

		vim.g.everforest_transparent_background = 2

		-- vim.g.everforest_colors_override = {
		-- 	bg0 = { "#202020", "234" },
		-- }
		vim.cmd.colorscheme("everforest")
	end,
}
