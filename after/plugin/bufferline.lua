local has_bl, bl = pcall(require 'bufferline')
if not has_bl then return end

bl.setup()
vim.api.nvim_set_keymap("n", "gb", ":BufferLinePick<CR>", {silent = true, noremap = true})
