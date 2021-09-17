local has_k, kommentary = pcall(require, 'kommentary.config')
if not has_k then return end
kommentary.use_extended_mappings()
vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>kommentary_visual_default", {})
vim.api.nvim_set_keymap("i", "<C-_>", '<ESC>:execute "normal \\<Plug>kommentary_line_default"<CR>', {silent = true})
