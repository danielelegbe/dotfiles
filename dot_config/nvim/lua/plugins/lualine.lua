return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
      },
    })
  end,
  opts = {
    sections = {
      lualine_y = {},
      lualine_z = {},
    },
  },
}
