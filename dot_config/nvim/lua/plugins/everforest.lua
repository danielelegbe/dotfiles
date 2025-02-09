return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.everforest_background = "hard"
		vim.g.everforest_enable_italic = true
		vim.g.everforest_ui_contrast = "high"
		vim.g.everforest_diagnostic_virtual_text = "colored"
		vim.g.everforest_better_performance = 1

		vim.g.everforest_transparent_background = 1

		vim.g.everforest_colors_override = {
			bg0 = { "#272f34", "234" },
			bg_visual = { "#384b55", "234" },
		}

		vim.cmd.colorscheme("everforest")
	end,
}
