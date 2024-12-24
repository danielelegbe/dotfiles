return {
	"stevearc/overseer.nvim",
	opts = {},
	config = function()
		local overseer = require("overseer")
		overseer.setup()

		vim.keymap.set("n", "<leader>ot", "<CMD>OverseerToggle<CR>", { desc = "[O]verseer [T]oggle" })
		vim.keymap.set("n", "<leader>or", "<CMD>OverseerRun<CR>", { desc = "[O]verseer [R]un" })
	end,
}
