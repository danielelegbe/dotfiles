return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	config = function()
		---@type rustaceanvim.Opts
		vim.g.rustaceanvim = {

			---@type rustaceanvim.dap.Opts
			dap = {},
			tools = {
				float_win_config = {
					auto_focus = true,
					open_split = "vertical",
				},
			},
		}
	end,
}
