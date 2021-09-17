local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = " "
map("n", "<Space>", "<NOP>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<Leader>y", '"+y', opts)
map("v", "<Leader>y", '"+y', opts)

map("v", "<S-j>", ":m .+1<CR>gv=gv", opts)
map("v", "<S-k>", ":m .-2<CR>gv=gv", opts)

map("n", "<tab>", ":bnext<CR>", opts)
map("n", "<S-tab>", ":bprevious<CR>", opts)
map("n", "<leader><tab>", ":tabnext<CR>", opts)
map("n", "<leader><S-tab>", ":tabprevious<CR>", opts)
map("n", "<leader>nt", ":tabedit %<CR>", opts)
map("n", "<leader>dt", ":tabclose<CR>", opts)

map("n", "<M-h>", ":vertical resize +3<CR>", opts)
map("n", "<M-j>", ":res -1<CR>", opts)
map("n", "<M-k>", ":res +1<CR>", opts)
map("n", "<M-l>", ":vertical resize -3<CR>", opts)

map("n", "<leader>bd", "<Cmd>lua require('bufdelete').bufdelete(0)<CR>", opts)
map("n", "<leader>bc", ":BufOnly<CR>", opts)

map("v", "<leader>p", '"_dP', opts)
map("n", "<leader>d", '"_d', opts)
map("v", "<leader>d", '"_d', opts)
