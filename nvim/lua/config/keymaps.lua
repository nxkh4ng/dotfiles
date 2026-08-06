local map = vim.keymap.set

-- Others
map({ "n", "i", "c" }, "<A-z>", "<nop>")
map("n", "<Esc>", "<cmd>nohlsearch<cr>")
map("t", "<Esc><Esc>", "<C-\\><C-n>")

map("n", "J", "mzJ`z")
map("n", "<leader>Y", '"+Y')
map("v", "<leader>y", '"+y')

-- Center when moving
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Split
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-h>", "<C-w><C-h>")

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>")
map("n", "L", "<cmd>tabnext<cr>")
map("n", "H", "<cmd>tabprevious<cr>")

-- Open termial below
map("n", "<leader>tm", function()
	local current_height = vim.api.nvim_win_get_height(0)
	local height_percent = math.floor(current_height * 35 / 100)
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, height_percent)
end)
