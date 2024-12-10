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

		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open Harpoon" })

		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():add()
		end, { desc = "Mark File" })
	end,
}
