-- vim.api.nvim_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {silent = true, noremap = true})

--= Code Actions =--
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>lua require'lspsaga.codeaction'.range_code_action()<CR>", {silent = true, noremap = true})

--= Hover Doc =--
-- NOTE: nlua.nvim binds K, hover doc will work outside of neovim lua
vim.api.nvim_set_keymap("n", "K", "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", {silent = true, noremap = true})

--= Smart Scroll =--
-- NOTE: Experimental Binding (C-f/C-b default)
-- UTIL: replaced smart_scroll_with_saga() -> {plugdir}/saga .smart_scroll
vim.api.nvim_set_keymap("n", "<C-d>", "<cmd>lua require'plug-lspconfig.saga'.smart_scroll(1)<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-u>", "<cmd>lua require'plug-lspconfig.saga'.smart_scroll(-1)<CR>", {silent = true, noremap = true})

--= Signatures =--
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>", {silent=true, noremap=true})

--= Rename =--
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua require'lspsaga.rename'.rename()<CR>", {silent=true, noremap=true})

--= Definition =--
vim.api.nvim_set_keymap("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", {silent=true, noremap=true})

--= Float Term =-- keeping mappping here for now, will add own term with hiding support
-- vim.api.nvim_set_keymap("n", "<M-`>", "<cmd>lua require'lspsaga.floaterm'.open_float_terminal()<CR>", {silent=true, noremap=true})
