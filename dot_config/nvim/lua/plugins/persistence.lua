return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>ls", function() require("persistence").select() end,desc = "Select Session" },
  },
}
