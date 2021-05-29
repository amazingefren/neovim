vim.api.nvim_set_keymap('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", {silent=true, noremap=true})

vim.api.nvim_set_keymap('n', '<leader>k', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", {silent=true, noremap=true})

vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", {silent=true, noremap=true})
