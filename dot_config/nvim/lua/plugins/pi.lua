return {
  dir = "~/coding-projects/pi.nvim",
  dependencies = {
    {
      "folke/snacks.nvim",
      opts = {
        picker = { enabled = true },
      },
    },
    "sindrets/diffview.nvim",
  },
  opts = {
    pi_cmd = { "pi" },
    split = {
      side = "right",
      width = 80,
    },
    auto_follow = false,
    session_memory = true,
  },
}
