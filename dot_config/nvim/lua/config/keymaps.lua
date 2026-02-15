-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- File picker with Ctrl+P (includes hidden files)
-- Press Alt+H within the picker to toggle hidden files visibility
vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.files({ cwd = true })
end, { desc = "Find Files (including hidden)" })

-- Search in current buffer with Space+/
vim.keymap.set("n", "<leader>/", function()
  Snacks.picker.lines()
end, { desc = "Search in current buffer" })

-- Exit insert mode with jk
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- create a keymap that opens the current buffers when pressing <leader><leader>

vim.keymap.set("n", "<leader><leader>", function()
  Snacks.picker.buffers({
    focus = "list",
    layout = {
      preview = false,
      layout = {
        max_width = 80,
        max_height = 10,
      },
    },
  })
end, { desc = "Open buffers" })

-- Go back to last file with gb
vim.keymap.set("n", "gb", "<C-^>", { desc = "Go back to last file" })

-- Override LazyVim's default window navigation with tmux-aware navigation
-- These will work seamlessly between nvim splits and tmux panes
vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Navigate left" })
vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Navigate down" })
vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Navigate up" })
vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Navigate right" })

-- Organize and remove unused imports with <leader>oi
-- Works universally with any LSP that supports these code actions
vim.keymap.set("n", "<leader>oi", function()
  local params = vim.lsp.util.make_range_params()
  params.context = { diagnostics = {} }

  -- First, remove unused imports
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.removeUnused" },
      diagnostics = {},
    },
  })
end, { desc = "Organize & Remove Unused Imports" })
