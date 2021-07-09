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

--= Server =--
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- Typescript --> npm global typescript, typescript-language-server
require'lspconfig'.tsserver.setup{
  on_attach=on_attach
}

-- Lua --> Arch AUR lua-language-server(sumneko-language-server)
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = "/usr/bin/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  on_attach=on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- BASH --> npm global bash-language-server
require'lspconfig'.bashls.setup{
  on_attach=on_attach,
}

-- C/C++ --> clangd
require'lspconfig'.clangd.setup{
  on_attach=on_attach,
}

-- CSS/SCSS/LESS --> FOLLOW HTML INSTALL
require'lspconfig'.cssls.setup{
  on_attach=on_attach
}

-- Docker Lang Server -->  npm global dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup{
  on_attach=on_attach
}

-- Go --> Arch Package GoPls
require'lspconfig'.gopls.setup{
  on_attach=on_attach
}

-- GraphQl --> npm global graphql-language-service-cli
require'lspconfig'.graphql.setup{
  on_attach=on_attach
}

-- HTML --> npm global vscode-langservers-extracted
require'lspconfig'.html.setup {
  capabilities = capabilities;
  on_attach=on_attach
}

-- Json --> FOLLOW HTML INSTALL
require'lspconfig'.jsonls.setup{
  on_attach=on_attach
}

-- Python --> pip install 'python-language-server[all]' because I can
require'lspconfig'.pyls.setup{
  on_attach=on_attach

}

-- Rust --> Arch Package rust-anazlyer, because made with rust
require'lspconfig'.rust_analyzer.setup{
  on_attach=on_attach
}

--[[ vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
) ]]

-- vim.cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
-- vim.cmd[[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
