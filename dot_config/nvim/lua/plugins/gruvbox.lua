return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_visual = "blue background"
		vim.g.gruvbox_material_ui_contrast = "high"
		vim.g.gruvbox_material_float_style = "dim"
		vim.g.gruvbox_material_diagnostic_text_highlight = 1
		-- vim.g.gruvbox_material_diagnostic_line_highlight = 1
		vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
		vim.g.gruvbox_material_current_word = "high contrast background"
		vim.g.gruvbox_material_inlay_hints_background = "dimmed"

		vim.cmd.colorscheme("gruvbox-material")
	end,
}
