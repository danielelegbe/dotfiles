return {
  -- Configure conform.nvim to use Biome for formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome", "prettier" },
        typescript = { "biome", "prettier" },
        javascriptreact = { "biome", "prettier" },
        typescriptreact = { "biome", "prettier" },
        json = { "biome", "prettier" },
        jsonc = { "biome", "prettier" },
      },
      formatters = {
        biome = {
          command = "bunx",
          args = { "@biomejs/biome", "check", "--write", "--stdin-file-path", "$FILENAME" },
          stdin = true,
        },
      },
    },
  },

  -- Configure LSP to use Biome
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        biome = {},
        eslint = {}
      },
    },
  },
}
