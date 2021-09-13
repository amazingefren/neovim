require "bufferline".setup()
vim.api.nvim_set_keymap("n", "gb", ":BufferLinePick<CR>", {silent = true, noremap = true})
