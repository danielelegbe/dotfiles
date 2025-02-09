return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local harpoon = require("harpoon")
		local noice = require("noice")
		local function harpoon_component()
			local list = harpoon:list()
			local total_marks = #list.items
			if total_marks == 0 then
				return ""
			end

			local current_mark = "-"
			local current_file = vim.fn.bufname()

			for idx, item in ipairs(list.items) do
				if item.value == current_file then
					current_mark = tostring(idx)
					break
				end
			end

			return string.format("󱡅 %s/%d", current_mark, total_marks)
		end

		require("lualine").setup({
			options = {
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
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {
					{
						---@diagnostic disable-next-line: undefined-field
						noice.api.status.mode.get,
						---@diagnostic disable-next-line: undefined-field
						cond = noice.api.status.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						"overseer",
					},
				},
				lualine_y = { "filetype" },
			},
		})
	end,
}
