return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup({
			mappings = {
				add = "gss", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn",
			},
		})
		require("mini.indentscope").setup()
		require("mini.files").setup({
			mappings = {
				reset = ",",
				synchronize = "s",
				reveal_cwd = ".",
				go_in_plus = "<CR>",
				go_in = "l",
			},
			windows = {
				preview = true,
				width_focus = 40,
				width_preview = 40,
			},
		})

		vim.keymap.set("n", "<leader>mf", function()
			require("mini.files").open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open mini.files (Current file)" })
	end,
}
