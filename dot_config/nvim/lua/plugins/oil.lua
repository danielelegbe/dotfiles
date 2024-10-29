return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Explicitly require and type the setup options
		local oil = require("oil")

		---@type oil.SetupOpts
		local options = {
			default_file_explorer = true,
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
			keymaps = {
				["<C-s>"] = { "actions.close" },
			},
		}
		oil.setup(options)
		vim.keymap.set("n", "<leader>oo", "<cmd>Oil<CR>", { silent = true, noremap = true, desc = "Open Oil" })
	end,
}
