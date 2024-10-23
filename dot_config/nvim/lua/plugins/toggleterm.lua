return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 10, -- Size of the terminal (in percentage for horizontal and vertical splits)
			open_mapping = [[<C-\>]], -- Default keybinding to toggle the terminal
			shade_terminals = true, -- Shade the background of terminal
			direction = "horizontal", -- Open terminal in horizontal split (can be 'vertical', 'float', 'horizontal')
			close_on_exit = true, -- Automatically close the terminal when the process exits
			shell = vim.o.shell, -- Set the default shell
		})
		vim.keymap.set("n", "<leader>tt", function()
			require("toggleterm").toggle()
		end, { desc = "[T]oggle [T]erminal" })
	end,
}
