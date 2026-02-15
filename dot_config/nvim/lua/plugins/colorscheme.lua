return {
  -- Add Catppuccin colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
    },
  },

  -- Add One Dark colorscheme (kept as backup)
  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     -- Available styles: '', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
  --     style = "dark",
  --     transparent = false,
  --     term_colors = true,
  --     code_style = {
  --       comments = "italic",
  --       keywords = "none",
  --       functions = "none",
  --       strings = "none",
  --       variables = "none",
  --     },
  --     highlights = {
  --       -- React/Svelte components (lighter cyan-green)
  --       ["@tag.tsx"] = { fg = "#56b6c2" }, -- Lighter cyan-green for component tags
  --       ["@tag.jsx"] = { fg = "#56b6c2" },
  --       ["@tag.svelte"] = { fg = "#56b6c2" },
  --       ["@constructor.tsx"] = { fg = "#56b6c2" }, -- Component names
  --       ["@constructor.jsx"] = { fg = "#56b6c2" },
  --       ["@tag.builtin.tsx"] = { fg = "#56b6c2" },
  --       ["@tag.builtin.jsx"] = { fg = "#56b6c2" },
  --
  --       -- HTML tags (darker blue)
  --       ["@tag"] = { fg = "#4a9edb" }, -- Darker blue for HTML tags
  --       ["@tag.html"] = { fg = "#4a9edb" },
  --
  --       -- Tag delimiters/arrows (white for both HTML and components)
  --       ["@tag.delimiter"] = { fg = "#abb2bf" }, -- White/gray for tag brackets < >
  --       ["@tag.delimiter.tsx"] = { fg = "#abb2bf" },
  --       ["@tag.delimiter.jsx"] = { fg = "#abb2bf" },
  --       ["@tag.delimiter.html"] = { fg = "#abb2bf" },
  --
  --       -- HTML attributes/props (darker blue)
  --       ["@tag.attribute"] = { fg = "#4a9edb" }, -- HTML attributes/props
  --       ["@tag.attribute.tsx"] = { fg = "#4a9edb" },
  --       ["@tag.attribute.jsx"] = { fg = "#4a9edb" },
  --       ["@property.html"] = { fg = "#4a9edb" },
  --
  --       -- Indent scope line
  --       ["SnacksIndentScope"] = { fg = "#d4d4d4" },
  --     },
  --   },
  -- },

  -- Configure LazyVim to load Catppuccin Mocha
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
