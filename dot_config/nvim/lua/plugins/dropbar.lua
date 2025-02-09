return {
	"Bekaboo/dropbar.nvim",
	-- optional, but required for fuzzy finder support
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		{ "nvim-tress/nvim-web-devicons", opts = {} },
		build = "make",
	},
	config = function()
		local dropbar = require("dropbar")
		local sources = require("dropbar.sources")
		local utils = require("dropbar.utils")

		dropbar.setup({
			bar = {
				sources = function()
					return {
						utils.source.fallback({
							sources.lsp,
							sources.treesitter,
						}),
					}
				end,
			},
		})

		local dropbar_api = require("dropbar.api")
		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
	end,
}
