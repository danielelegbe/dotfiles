return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local harpoon = require("harpoon")
		local function harpoon_component()
			local total_marks = harpoon.get_marks()
			if total_marks == 0 then
				return ""
			end

			local current_mark = "-"

			local mark_idx = harpoon.get_current_index()
			if mark_idx == nil then
				current_mark = tostring(mark_idx)
			end

			return string.format("󱡅 %s/%d", current_mark, total_marks)
		end

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_b = {
					{ "branch", icon = "" },
					harpoon_component,
					"diff",
					"diagnostics",
				},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "filetype" },
			},
		})
	end,
}
