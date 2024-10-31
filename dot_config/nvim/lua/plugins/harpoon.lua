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
		map("n", "<leader>m", function()
			harpoon:list():add()
			vim.notify("󱡅  marked file")
		end, opts)

		map("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), {
				title = "Harpoon",
			})
		end, opts)
	end,
}
