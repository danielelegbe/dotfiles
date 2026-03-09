local function has_biome_config(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)
  local start = path ~= "" and vim.fs.dirname(path) or vim.uv.cwd()

  return vim.fs.find({ "biome.json", "biome.jsonc" }, {
    path = start,
    upward = true,
    stop = vim.uv.os_homedir(),
  })[1] ~= nil
end

local function js_formatter(bufnr)
  if has_biome_config(bufnr) then
    return { "biome" }
  end

  return { "prettier" }
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = js_formatter,
        typescript = js_formatter,
        javascriptreact = js_formatter,
        typescriptreact = js_formatter,
        json = js_formatter,
        jsonc = js_formatter,
      },
      formatters = {
        biome = {
          command = "bunx",
          args = { "@biomejs/biome", "format", "--stdin-file-path", "$FILENAME" },
          stdin = true,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        biome = {},
        eslint = {},
      },
    },
  },
}
