return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true, desc = "Open Harpoon" }
		local harpoon = require("harpoon")
		harpoon:setup()
		map("n", "<s-m>", function()
			harpoon:list():add()
			vim.notify("󱡅  marked file")
		end, opts)

		map("n", "<Tab>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), {
				ui_width_ratio = 0.4,
				title_pos = "",
				title = "Harpoon",
			})
		end, opts)
	end,
}
