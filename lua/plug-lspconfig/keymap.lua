local nvim_lsp = require "lspconfig"

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = {noremap = true, silent = true}

    buf_set_keymap("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    --= Code Actions =--
    buf_set_keymap("n", "<leader>ca", "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opts)
    buf_set_keymap("v", "<leader>ca", "<cmd>lua require'lspsaga.codeaction'.range_code_action()<CR>", opts)
    --= Hover Doc =--
    -- NOTE: nlua.nvim binds K, hover doc will work outside of neovim lua
    buf_set_keymap("n", "K", "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", opts)
    --= Smart Scroll =--
    -- NOTE: Experimental Binding (C-f/C-b default)
    -- UTIL: replaced smart_scroll_with_saga() -> {plugdir}/saga .smart_scroll
    buf_set_keymap("n", "<C-d>", "<cmd>lua require'plug-lspconfig.saga'.smart_scroll(1)<CR>", opts)
    buf_set_keymap("n", "<C-u>", "<cmd>lua require'plug-lspconfig.saga'.smart_scroll(-1)<CR>", opts)
    --= Signatures =--
    buf_set_keymap("n", "<leader>k", "<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>", opts)
    --= Rename =--
    buf_set_keymap("n", "<leader>rn", "<cmd>lua require'lspsaga.rename'.rename()<CR>", opts)
    --= Definition =--
    buf_set_keymap("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
end

local servers = {
    "tsserver",
    "sumneko_lua",
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "gopls",
    "graphql",
    "html",
    "jsonls",
    "pyls",
    "rust_analyzer"
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        }
    }
end
