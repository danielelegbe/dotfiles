return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})
		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					initial_mode = "normal",
					actions = {
						["dd"] = require("telescope.actions").delete_buffer,
					},
				})
				:find()
		end

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true, desc = "Open Harpoon" }
		harpoon:setup()
		map("n", "M", function()
			harpoon:list():add()
			vim.notify("󱡅  marked file")
		end, opts)

		vim.keymap.set("n", "H", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
