require "toggleterm".setup {
    direction = "float"
}
local Terminal = require("toggleterm.terminal").Terminal
local lg = Terminal:new({cmd = "lazygit", hidden = true})
-- vim.api.nvim_set_keymap('t','<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-Space>", ":ToggleTerm<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-Space>", "<C-\\><C-n>:ToggleTerm<CR>", {noremap = true, silent = true})
function LG_TOGGLE()
    lg:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>lg", "<Cmd>lua LG_TOGGLE()<CR>", {noremap = true, silent = true})
