local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-e>", api.tree.toggle, opts("Toggle"))
end

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local nvim_tree = require("nvim-tree")
		nvim_tree.setup({
			on_attach = my_on_attach,
			view = {
				relativenumber = true,
				width = {
					padding = 1,
				},
			},
			actions = {
				open_file = {
					resize_window = false,
				},
			},
		})

		vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Open Nvim tree" })
	end,
}
