return {
  "folke/snacks.nvim",
  keys = {
    { "<C-->", function() Snacks.explorer() end, desc = "Toggle Explorer" },
  },
  opts = {
    picker = {
      win = {
        list = {
          keys = {
            ["v"] = "edit_vsplit",
          },
        },
      },
    },
  },
}
