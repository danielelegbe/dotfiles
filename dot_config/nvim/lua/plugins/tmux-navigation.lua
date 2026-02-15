return {
  "alexghergh/nvim-tmux-navigation",
  lazy = false, -- Load immediately before keymaps are set
  config = function()
    require("nvim-tmux-navigation").setup({
      disable_when_zoomed = true,
    })
  end,
}
