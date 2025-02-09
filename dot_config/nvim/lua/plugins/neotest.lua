local find_vitest_config_file_and_cwd = function(file)
	if string.find(file, "/server/") then
		return vim.fn.fnamemodify(file, ":h"):match("(.-/[^/]+/)src") .. "vitest.config.ts",
			vim.fn.fnamemodify(file, ":h"):match("(.-/[^/]+/)src")
	elseif string.find(file, "/client/") then
		return vim.fn.fnamemodify(file, ":h"):match("(.-/[^/]+/)src") .. "vite.config.ts",
			vim.fn.fnamemodify(file, ":h"):match("(.-/[^/]+/)src")
	else
		return nil, vim.fn.getcwd() -- Return current working directory if not in client/server
	end
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-jest",
		"nvim-neotest/neotest-go",
	},
	config = function()
		-- Function to find the correct Vitest config file and working directory
		local neotest = require("neotest")

		-- Helper to run tests with dynamic Vitest config file and working directory
		local run_tests = function()
			local file = vim.fn.expand("%:p") -- Get the full path of the current file
			local config, cwd = find_vitest_config_file_and_cwd(file) -- Find the correct vitest config file and cwd

			if config and vim.fn.filereadable(config) == 1 then
				neotest.run.run({ extra_args = { "--config", config }, cwd = cwd })
			else
				-- If config isn't found, run tests in the current working directory
				neotest.run.run()
			end
		end

		neotest.setup({
			adapters = {
				require("neotest-jest"),
				require("neotest-go"),
				require("neotest-vitest")({
					filter_dir = function(name)
						return name ~= "node_modules"
					end,
				}),
				require("rustaceanvim.neotest"),
			},
		})

		-- Keymap for running tests with dynamic config and working directory
		vim.keymap.set("n", "<leader>tr", run_tests, { noremap = true, silent = true, desc = "Run Tests" })

		-- Keymap for toggling the test summary
		vim.keymap.set("n", "<leader>ts", function()
			neotest.summary.toggle()
		end, { noremap = true, silent = true, desc = "Open Test Summary" })

		vim.keymap.set("n", "<leader>to", function()
			neotest.output.open()
		end, { noremap = true, silent = true, desc = "Open Test Output" })
	end,
}
