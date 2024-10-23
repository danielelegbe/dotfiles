local opts = { noremap = true, silent = true }

-- Set keymaps with flexible options
vim.api.nvim_set_keymap("i", "jk", "<Esc>", opts)

-- Remove search highlighting when you escape
vim.api.nvim_set_keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Open diagnostic quickfix list
vim.keymap.set("n", "<leader>qq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Save file
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Delete single character without adding to the register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
-- Check to see if the current window is a float window
local function resize_window(direction)
	local is_float = vim.api.nvim_win_get_config(0).relative ~= ""
	if not is_float then
		if direction == "up" then
			vim.cmd("resize -2")
		elseif direction == "down" then
			vim.cmd("resize +2")
		elseif direction == "left" then
			vim.cmd("vertical resize -2")
		elseif direction == "right" then
			vim.cmd("vertical resize +2")
		end
	end
end

vim.keymap.set("n", "<Up>", function()
	resize_window("up")
end, opts)
vim.keymap.set("n", "<Down>", function()
	resize_window("down")
end, opts)
vim.keymap.set("n", "<Left>", function()
	resize_window("left")
end, opts)
vim.keymap.set("n", "<Right>", function()
	resize_window("right")
end, opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>qb", ":Bdelete!<CR>", { silent = true, noremap = true, desc = "[q]uit [b]uffer" })
vim.keymap.set("n", "<leader>qB", ":%bd|e#|bd#<CR>", { silent = true, noremap = true, desc = "[q]uit Other [B]uffers" })
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", { silent = true, noremap = true, desc = "New [B]uffer" })

-- Window management
vim.keymap.set("n", "<leader>ww", "<C-w>v", { silent = true, noremap = true, desc = "Split [W]indow Vertically" })
vim.keymap.set("n", "<leader>h", "<C-w>s", { silent = true, noremap = true, desc = "Split Window [H]orizontally" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { silent = true, noremap = true, desc = "Balance Windows [=]" })
vim.keymap.set("n", "<leader>qw", "<C-w>q", { silent = true, noremap = true, desc = "[q]uit [w]indow" })
vim.keymap.set("n", "<leader>qW", "<C-w>o", { silent = true, noremap = true, desc = "[q]uit Other [W]indows" })

-- Toggle line wrapping
vim.keymap.set(
	"n",
	"<leader>lw",
	":set wrap!<CR>",
	{ silent = true, noremap = true, desc = "Toggle [L]ine [W]rapping" }
)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)
