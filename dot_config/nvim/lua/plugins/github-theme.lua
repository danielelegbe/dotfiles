-- Install without configuration
-- Or with configuration
return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	-- lazy = false, -- make sure we load this during startup if it is your main colorscheme TODO: turn this on and the line below when in use
	-- priority = 1000, -- make sure to load this before all the other start plugins
	enabled = false,
	config = function()
		-- vim.cmd("colorscheme github_dark")
	end,
}
