return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "s", function()
					harpoon.ui:save()
					harpoon.ui:close_menu()
				end, { buffer = cx.bufnr })
			end,
		})

		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open Harpoon" })

		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():add()
			vim.notify("Marked file")
		end, { desc = "Mark File" })
	end,
}
