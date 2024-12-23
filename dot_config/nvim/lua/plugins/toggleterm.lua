return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			shade_terminals = true, -- Shade the background of terminal
			direction = "float", -- Open terminal in horizontal split (can be 'vertical', 'float', 'horizontal')
			close_on_exit = true, -- Automatically close the terminal when the process exits
			shell = vim.o.shell, -- Set the default shell
		})
		vim.keymap.set({ "n", "t" }, "<leader>tt", function()
			require("toggleterm").toggle()
		end, { desc = "[T]oggle [T]erminal" })
	end,
}
