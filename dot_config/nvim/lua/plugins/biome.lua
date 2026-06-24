return {
	-- Configure conform.nvim to use Biome for formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
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
			servers = {
				biome = {},
			},
		},
	},
}
